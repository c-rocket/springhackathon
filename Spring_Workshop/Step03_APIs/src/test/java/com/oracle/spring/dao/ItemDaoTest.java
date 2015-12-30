package com.oracle.spring.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/test-context.xml" })
@Transactional
public class ItemDaoTest {

	@Resource
	private ItemDao dao;

	@Test
	public void getItems() throws Exception {
		// execute
		List<Map<String, Object>> items = dao.getItems();

		// assert
		assertTrue(items.size() > 0);
	}
}
