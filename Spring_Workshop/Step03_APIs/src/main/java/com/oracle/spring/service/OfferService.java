package com.oracle.spring.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.spring.dao.OfferDao;

@Service
@Transactional
public class OfferService {

	@Resource
	private OfferDao dao;

	public List<Map<String, Object>> getOffersForItem(Integer itemId) {
		return dao.getOffersForItem(itemId);
	}

	public Boolean updateOffer(Integer offerId, String status) {
		return dao.updateOffer(offerId, status);
	}

	public Map<String, Object> createOffer(Integer itemId, String offerBy, Double amount) {
		if (dao.createOffer(itemId, offerBy, amount)) {
			return dao.getCreatedOffer(itemId, offerBy, amount);
		}
		return null;
	}

}
