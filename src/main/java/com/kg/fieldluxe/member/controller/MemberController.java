package com.kg.fieldluxe.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kg.fieldluxe.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private IMemberService service;
	
	@GetMapping("/auctionList") // 경매 참여 내역
	public String auctionList(Model model) {
		//model.addAttribute("list", service.);
		return "auction/AuctionPartList";
	}

}
