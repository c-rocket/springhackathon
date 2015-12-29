package com.oracle.spring.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oracle.spring.dao.ItemDao;

@Service
public class ItemService {

	@Resource
	private ItemDao dao;

	public List<Map<String, Object>> getItems() {
		return dao.getItems();
	}

}
