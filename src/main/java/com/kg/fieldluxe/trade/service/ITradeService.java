package com.kg.fieldluxe.trade.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.trade.model.CollaboVO;

public interface ITradeService {

	//경매내역 리스트
	List<CollaboVO> getAuctionList(String email, int page);

	//경매내역 갯수
	int getAuctionCount(String email);

	//구매내역 리스트
	List<CollaboVO> getPurchaseList(String email, int page);

	//구매내역 갯수
	int getPurchaseCount(String email);

	//판매내역 리스트
	List<CollaboVO> getSalesList(String email, int page);

	//판매내역 갯수
	int getSalesCount(String email);

	//경매내역 상세보기
	CollaboVO getAuctionDetail(int tradeId);

	//구매내역 상세보기
	CollaboVO getPurchaseDetail(int tradeId);

	//판매내역 상세보기
	CollaboVO getSalesDetail(int tradeId);

	//배송상태 수정
	void updateDeliveryStatus(int tradeId);


}
