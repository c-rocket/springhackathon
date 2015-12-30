package com.oracle.spring.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.spring.dao.CommentDao;

@Service
@Transactional
public class CommentService {

	@Resource
	private CommentDao dao;

	public List<Map<String, Object>> getCommentsForItem(Integer itemId) {
		return dao.getCommentsForItem(itemId);
	}

	public Boolean createComment(Integer itemId, String postedBy, String text) {
		return dao.createComment(itemId, postedBy, text);
	}

}
