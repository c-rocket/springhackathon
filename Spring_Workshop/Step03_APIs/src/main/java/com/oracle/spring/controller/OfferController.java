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

import com.oracle.spring.service.OfferService;

@Controller
public class OfferController {
	private static final Logger logger = LoggerFactory.getLogger(OfferController.class);

	@Resource
	private OfferService service;

	@RequestMapping(value = "/offer/${itemId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getOffers(@PathVariable(value = "itemId") Integer itemId) {
		logger.info("Getting offers for: " + itemId);
		return service.getOffersForItem(itemId);
	}

	@RequestMapping(value = "/offer/${offerId}", method = RequestMethod.PUT)
	@ResponseBody
	public Boolean updateOffer(@RequestParam(value = "p1") String status,
			@RequestParam(value = "offerId") Integer offerId) {
		logger.info("Updating Offer");
		return service.updateOffer(offerId, status);
	}

	@RequestMapping(value = "/newOffer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createOffer(@RequestParam(value = "p1") Integer itemId,
			@RequestParam(value = "p2") String offerBy, @RequestParam(value = "p2") Double amount) {
		logger.info("Creating Offer");
		return service.createOffer(itemId, offerBy, amount);
	}
}
