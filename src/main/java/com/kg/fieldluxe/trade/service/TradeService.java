package com.kg.fieldluxe.trade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kg.fieldluxe.trade.model.CollaboVO;
import com.kg.fieldluxe.trade.repository.ITradeMapper;

@Service
public class TradeService implements ITradeService {
	
	@Autowired
	private ITradeMapper mapper;

	@Override
	public List<CollaboVO> getAuctionList(String email, int page) {
		List<CollaboVO> auctionList = mapper.getAuctionList(email, page);
		return auctionList;
	}
	
	@Override
	public int getAuctionCount(String email) {
		int auctionCount = mapper.getAuctionCount(email);
		return auctionCount;
	}

	@Override
	public List<CollaboVO> getPurchaseList(String email, int page) {
		List<CollaboVO> purchaseList = mapper.getPurchaseList(email, page);
		return purchaseList;
	}

	@Override
	public int getPurchaseCount(String email) {
		int purchaseCount = mapper.getPurchaseCount(email);
		return purchaseCount;
	}

	@Override
	public List<CollaboVO> getSalesList(String email, int page) {
		List<CollaboVO> salesList = mapper.getSalesList(email, page);
		return salesList;
	}

	@Override
	public int getSalesCount(String email) {
		int salesCount = mapper.getSalesCount(email);
		return salesCount;
	}

	

	

}
