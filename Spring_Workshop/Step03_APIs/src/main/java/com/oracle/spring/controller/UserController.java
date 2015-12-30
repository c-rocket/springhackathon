package com.oracle.spring.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.spring.controller.exception.CreationErrorException;
import com.oracle.spring.controller.exception.UnAuthorizedException;
import com.oracle.spring.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);

	@Resource
	private UserService service;

	@RequestMapping(value = "/userpass", method = RequestMethod.GET)
	@ResponseBody
	public Boolean changePassword(@RequestParam(value = "email") String email,
			@RequestParam(value = "username") String oldpw, @RequestParam(value = "username") String newpw) {
		logger.info("Getting items");
		try {
			if (service.changePassword(email, oldpw, newpw)) {
				return true;
			} else {
				throw new UnAuthorizedException();
			}
		} catch (Exception e) {
			logger.error("Error creating user", e);
			throw new UnAuthorizedException(e);
		}
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createUser(@RequestParam(value = "username") String username,
			@RequestParam(value = "email") String email, @RequestParam(value = "pw") String password) {
		logger.info("Getting items");
		try {
			return service.createUser(username, email, password);
		} catch (Exception e) {
			logger.error("Error creating user", e);
			throw new CreationErrorException(e);
		}
	}

	@RequestMapping(value = "/login/{email}/{password}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(@PathVariable(value = "email") String email,
			@PathVariable(value = "password") String password) {
		logger.info("Getting items");
		try {
			Map<String, Object> login = service.login(email, password);
			if (login != null) {
				return login;
			} else {
				throw new UnAuthorizedException();
			}
		} catch (Exception e) {
			logger.error("Error creating user", e);
			throw new UnAuthorizedException(e);
		}
	}
}
