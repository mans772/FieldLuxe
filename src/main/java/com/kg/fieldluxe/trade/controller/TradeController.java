package com.kg.fieldluxe.trade.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kg.fieldluxe.commons.PageCreator;
import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.trade.model.CollaboVO;
import com.kg.fieldluxe.trade.service.ITradeService;

@Controller
@RequestMapping("/trade")
public class TradeController {
	
	@Autowired
	private ITradeService service;
	
	@GetMapping("/auctionList")
	public String auctionList(String email, SearchVO search, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); //1 페이지 초기값
		
		List<CollaboVO> auctionList = service.getAuctionList(email, search.getPage());
		pc.setProductTotalCount(service.getAuctionCount(email)); //경매 갯수 구하기
		
		model.addAttribute("auctionList", auctionList);
		model.addAttribute("pc", pc);
		
		return "trade/auctionList";
	}
	
	@GetMapping("/purchaseList")
	public String purchaseList(String email, SearchVO search, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); //1 페이지 초기값
		
		List<CollaboVO> purchaseList = service.getPurchaseList(email, search.getPage());
		pc.setProductTotalCount(service.getPurchaseCount(email)); //구매 갯수 구하기
		
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pc", pc);
		
		return "trade/purchaseList";
	}
	
	@GetMapping("/salesList")
	public String salesList(String email, SearchVO search, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); //1 페이지 초기값
		
		List<CollaboVO> salesList = service.getSalesList(email, search.getPage());
		pc.setProductTotalCount(service.getSalesCount(email)); //판매 갯수 구하기
		
		model.addAttribute("salesList", salesList);
		model.addAttribute("pc", pc);
		
		return "trade/salesList";
	}
	
	@GetMapping("/auctionDetail/{tradeId}")
	public String auctionDetail(@PathVariable int tradeId, Model model) {
		CollaboVO auctionDetail = service.getAuctionDetail(tradeId);
		model.addAttribute("auction", auctionDetail);
		return "trade/auctionDetail";
	}
	
	@GetMapping("/purchaseDetail/{tradeId}")
	public String purchaseDetail(@PathVariable int tradeId, Model model) {
		CollaboVO purchaseDetail = service.getPurchaseDetail(tradeId);
		model.addAttribute("purchase", purchaseDetail);
		return "trade/purchaseDetail";
	}
	
	@GetMapping("/salesDetail/{tradeId}")
	public String salesDetail(@PathVariable int tradeId, Model model) {
		CollaboVO salesDetail = service.getSalesDetail(tradeId);
		model.addAttribute("sales", salesDetail);
		return "trade/salesDetail";
	}
	
	@GetMapping("/purchaseConfirm/{tradeId}")
	public String purchaseConfirm(@PathVariable int tradeId) {
		service.updateDeliveryStatus(tradeId);
		return "redirect:/trade/purchaseDetail/" + tradeId;
	}
	
	
	
	
	
	
	
	

}
