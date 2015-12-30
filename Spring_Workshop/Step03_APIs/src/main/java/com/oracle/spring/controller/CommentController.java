package com.oracle.spring.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.spring.service.CommentService;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Resource
	private CommentService service;

	@RequestMapping(value = "/comment/${itemId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getComments(@PathVariable(value = "itemId") Integer itemId) {
		logger.info("Getting comments for: " + itemId);
		return service.getCommentsForItem(itemId);
	}

	@RequestMapping(value = "/newComment", method = RequestMethod.POST)
	@ResponseBody
	public Boolean createComment(@RequestParam(value = "p1") Integer itemId,
			@RequestParam(value = "p2") String postedBy, @RequestParam(value = "p3") String text) {
		logger.info("Getting items");
		return service.createComment(itemId, postedBy, text);
	}
}
