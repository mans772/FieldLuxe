package com.kg.fieldluxe.trade.model;

import com.kg.fieldluxe.member.model.MemberVO;
import com.kg.fieldluxe.product.model.DealData;
import com.kg.fieldluxe.product.model.DetailData;
import com.kg.fieldluxe.product.model.ListData;

public class CollaboVO {
	
	private TradeVO tradeVO;
	private ListData listData;
	private DealData dealData;
	private DetailData detailData;
	private MemberVO memberVO;
	
	public CollaboVO() {}

	public CollaboVO(TradeVO tradeVO, ListData listData, DealData dealData, DetailData detailData, MemberVO memberVO) {
		super();
		this.tradeVO = tradeVO;
		this.listData = listData;
		this.dealData = dealData;
		this.detailData = detailData;
		this.memberVO = memberVO;
	}

	public TradeVO getTradeVO() {
		return tradeVO;
	}

	public void setTradeVO(TradeVO tradeVO) {
		this.tradeVO = tradeVO;
	}

	public ListData getListData() {
		return listData;
	}

	public void setListData(ListData listData) {
		this.listData = listData;
	}

	public DealData getDealData() {
		return dealData;
	}

	public void setDealData(DealData dealData) {
		this.dealData = dealData;
	}

	public DetailData getDetailData() {
		return detailData;
	}

	public void setDetailData(DetailData detailData) {
		this.detailData = detailData;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}
