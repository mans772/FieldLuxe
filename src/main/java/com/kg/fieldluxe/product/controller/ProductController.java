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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kg.fieldluxe.commons.PageCreator;
import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.model.DealData;
import com.kg.fieldluxe.product.model.DetailData;
import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.product.model.ProductVO;
import com.kg.fieldluxe.product.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService service;
	
//	@GetMapping("/list") // 寃��닔 �셿猷� 紐⑸줉
//	public String checkedList(Model model) {
//		System.out.println("checkedList");
//		model.addAttribute("list", service.list(true, null));
//		return "product/list";
//	}
	
//	@PostMapping("/list") // 寃��닔 �븘�슂 紐⑸줉
//	public String checkingList(Model model) {
//		System.out.println("checkingList");
//		model.addAttribute("list", service.list(false, null));
//		return "product/list";
//	}
	
	@GetMapping("/content/{productId}") // �긽�꽭 �럹�씠吏�
	public ModelAndView content(@PathVariable int productId, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/productDetail");
		mv.addObject("product", service.detail(productId));
		return mv;
	}
	
	@DeleteMapping("/content/{productId}") // �궘�젣 �옉�뾽
	@ResponseBody
	public String delete(@PathVariable int productId) {
		// service.delete(productId);
		System.out.println(productId + "번 글 삭제요청");
		return "delete";
	}
	
	@PutMapping("/content/{productId}") // 寃��닔 �옉�뾽
	public ModelAndView check(@PathVariable int productId, char status, String rejectReason) {
		ModelAndView mv = new ModelAndView();
		service.update(service.detail(productId), status, rejectReason);
		mv.setViewName("redirect:/product/list");
		return mv;
	}
	
	@GetMapping("/modify/{productId}") // �닔�젙 �럹�씠吏�
	public String modify(@PathVariable int productId, Model model) {
		model.addAttribute("product", service.detail(productId));
		return "product/productModify";
	}
	
	@PutMapping("/modify/{productId}") // �닔�젙 �옉�뾽
	public String modify(@PathVariable int productId, ListData listData, DealData dealData, DetailData detailData) {
		service.update(new ProductVO(listData, dealData, detailData), '0', null);
		return "redirect:/product/content/" + listData.getProductId();
	}
	
	@GetMapping("/regist") // 臾쇳뭹 �떊洹� �벑濡� �럹�씠吏�
	public String regist() {
		return "product/productRegist";
	}
	
	@PostMapping("/regist") // 臾쇳뭹 �떊洹� �벑濡� �옉�뾽
	public String regist(ListData listData, DealData dealData, DetailData detailData) {
		service.insert(new ProductVO(listData, dealData, detailData));
		return "redirect:/product/list";
	}
	
	@GetMapping("/pay") // 寃곗젣 �솕硫� �슂泥�
	public String pay(int productId, Model model) {
		model.addAttribute("product", service.detail(productId));
		return "product/productPayment";
	}
	
	@GetMapping("/") //상품 전체 목록
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
		return "member/Profile_01";
	}

	
}