package com.kg.fieldluxe.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kg.fieldluxe.commons.PageCreator;
import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.model.DealData;
import com.kg.fieldluxe.product.model.DetailData;
import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.product.model.ProductVO;
import com.kg.fieldluxe.product.service.IProductService;
import com.kg.fieldluxe.review.model.ReviewVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService service;
	
	@GetMapping("/list") // 검수 완료 목록
	public String checkedList(Model model) {
		System.out.println("checkedList");
		model.addAttribute("list", service.list(true, null));
		return "product/list";
	}
	
	@PostMapping("/list") // 검수 필요 목록
	public String checkingList(Model model) {
		System.out.println("checkingList");
		model.addAttribute("list", service.list(false, null));
		return "product/list";
	}
	
	@GetMapping("/content/{productId}") // 상세 페이지
	public String content(@PathVariable int productId, Model model) {
		model.addAttribute("product", service.detail(productId));
		return "product/detail";
	}
	
	@DeleteMapping("/content/{productId}") // 삭제 작업
	public String delete(@PathVariable int productId) {
		service.delete(productId);
		return "redirect:/product/list";
	}
	
	@PutMapping("/content/{productId}") // 검수 작업
	public String check(@PathVariable int productId, char status, String rejectReason) {
		service.update(service.detail(productId), status, rejectReason);
		return "redirect:/product/list";
	}
	
	@GetMapping("/modify/{productId}") // 수정 페이지
	public String modify(@PathVariable int productId, Model model) {
		model.addAttribute("product", service.detail(productId));
		return "product/modify";
	}
	
	@PutMapping("/modify/{productId}") // 수정 작업
	public String modify(@PathVariable int productId, ListData listData, DealData dealData, DetailData detailData) {
		service.update(new ProductVO(listData, dealData, detailData), '0', null);
		return "redirect:/product/content/" + listData.getProductId();
	}
	
	@GetMapping("/regist") //  물품 신규 등록 페이지
	public String regist() {
		return "product/regist";
	}
	
	@PostMapping("/regist") // 물품 신규 등록 작업
	public String regist(ListData listData, DealData dealData, DetailData detailData) {
		service.insert(new ProductVO(listData, dealData, detailData));
		return "redirect:/product/list";
	}
	
	@GetMapping("/pay") // 결제 화면 요청
	public String pay(int productId, Model model) {
		model.addAttribute("product", service.detail(productId));
		return "product/pay";
	}
	
	@GetMapping("/productList") //상품 전체 목록
	public String productList(Model model, SearchVO search) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);
		
		List<ListData> list = service.getProductList(search);
		pc.setProductTotalCount(service.getProductCount(search));

		model.addAttribute("productList", list);
		model.addAttribute("pc", pc);

		return "product/productList";
	}

	@GetMapping("/inspectList") //상품 검수 목록
	public String inspectList(Model model) {
		List<ListData> list = service.getInspectList();
		model.addAttribute("inspectList", list);
		return "product/inspectList";
	}

	@GetMapping("/profileProductList") //프로필 상품 목록
	public String profileProductList(Model model, String email) {
		List<ListData> list = service.getProfileProductList(email);
		model.addAttribute("profileProductList", list);
		return "member/profileProductList";
	}

	
}