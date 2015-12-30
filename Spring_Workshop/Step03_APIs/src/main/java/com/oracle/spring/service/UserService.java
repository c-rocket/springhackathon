package com.oracle.spring.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.spring.dao.UserDao;
import com.oracle.spring.util.Gravatar;
import com.springcryptoutils.core.cipher.symmetric.Cipherer;

@Service
@Transactional
public class UserService {

	@Resource
	private UserDao dao;

	private static final byte[] iv = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
	private static final byte[] key = "superSecretKey".getBytes();

	@Resource
	@Qualifier("encrypter")
	private Cipherer encrypter;

	@Resource
	@Qualifier("decrypter")
	private Cipherer decrypter;

	public Boolean changePassword(String email, String oldpw, String newpw) {
		String oldHash = String.valueOf(encrypter.encrypt(key, iv, oldpw.getBytes()));
		String newHash = String.valueOf(encrypter.encrypt(key, iv, newpw.getBytes()));
		Map<String, Object> user = dao.getUserByEmail(email);
		if (oldHash.equals(user.get("USER_PASSWORD"))) {
			dao.update(email, newHash);
			return true;
		}
		return false;
	}

	public Map<String, Object> createUser(String username, String email, String password) {
		String hash = String.valueOf(encrypter.encrypt(key, iv, password.getBytes()));
		String gravatar = Gravatar.url(email);
		dao.createUser(username, email, hash, gravatar);
		return dao.getUserByEmail(email);
	}

	public Map<String, Object> login(String email, String password) {
		byte[] hash = encrypter.encrypt(key, iv, password.getBytes());
		Map<String, Object> user = dao.getUserByEmail(email);
		if (user != null && hash.equals(user.get("USER_PASSWORD"))) {
			return user;
		}
		return null;
	}

}
