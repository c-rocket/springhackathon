package com.oracle.spring.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.spring.dao.ItemDao;

@Service
@Transactional
public class ItemService {

	@Resource
	private ItemDao dao;

	public List<Map<String, Object>> getItems() {
		return dao.getItems();
	}

	public Map<String, Object> createItem(String title, String description, String postedBy, String status,
			String price) {
		dao.create(title, description, postedBy, status, price);
		return dao.getItemByName(title, postedBy);
	}

	public Map<String, Object> getItem(Integer id) {
		return dao.getItembyId(id);
	}

	public Boolean deleteItem(Integer id) {
		return dao.deleteItem(id);
	}

	public Boolean updateItem(Integer itemId, String title, String description, String purchasedBy, Double price,
			String status) {
		return dao.updateItem(itemId, title, description, purchasedBy, price, status);
	}

}
