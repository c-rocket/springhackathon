package com.oracle.spring.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.spring.service.ItemService;

@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Resource
	private ItemService service;

	@RequestMapping(value = "/items", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getItems() {
		logger.info("Getting items");
		return service.getItems();
	}
}
