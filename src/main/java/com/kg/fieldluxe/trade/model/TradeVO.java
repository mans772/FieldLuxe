package com.kg.fieldluxe.trade.model;

import java.util.Date;

public class TradeVO {
	
	private int tradeId;
	private int tradeClass;
	private Date tradeDate;
	private String tradeSeller;
	private String tradePurchaser;
	private int productId;
	
	public int getTradeId() {
		return tradeId;
	}
	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}
	public int getTradeClass() {
		return tradeClass;
	}
	public void setTradeClass(int tradeClass) {
		this.tradeClass = tradeClass;
	}
	public Date getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}
	public String getTradeSeller() {
		return tradeSeller;
	}
	public void setTradeSeller(String tradeSeller) {
		this.tradeSeller = tradeSeller;
	}
	public String getTradePurchaser() {
		return tradePurchaser;
	}
	public void setTradePurchaser(String tradePurchaser) {
		this.tradePurchaser = tradePurchaser;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
}
