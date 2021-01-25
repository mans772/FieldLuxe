package com.kg.fieldluxe.trade.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.trade.model.CollaboVO;

public interface ITradeMapper {

	//경매내역 리스트
	List<CollaboVO> getAuctionList(@Param("email") String email, @Param("page") int page);

	//경매내역 갯수
	int getAuctionCount(String email);

	//구매내역 리스트
	List<CollaboVO> getPurchaseList(@Param("email") String email, @Param("page") int page);

	//구매내역 갯수
	int getPurchaseCount(String email);

	//판매내역 리스트
	List<CollaboVO> getSalesList(@Param("email") String email, @Param("page") int page);

	//판매내역 갯수
	int getSalesCount(String email);

}
