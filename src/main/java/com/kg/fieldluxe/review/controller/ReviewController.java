package com.kg.fieldluxe.review.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kg.fieldluxe.commons.PageCreator;
import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.service.IProductService;
import com.kg.fieldluxe.review.model.ReviewVO;
import com.kg.fieldluxe.review.service.IReviewService;
import com.kg.fieldluxe.trade.model.CollaboVO;
import com.kg.fieldluxe.trade.service.ITradeService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private IReviewService reviewService;

	@Autowired
	private ITradeService tradeService;

	// 내 리뷰 목록 보기
	@GetMapping("/list")
	public void reviewList(@RequestParam(required=false, defaultValue="1")int page, 
			@RequestParam(required=false)String word,  Model model) {

		Map<Integer, String> starRating = new HashMap<Integer, String>();
		starRating.put(0, "☆☆☆☆☆");
		starRating.put(1, "★☆☆☆☆");
		starRating.put(2, "★★☆☆☆");
		starRating.put(3, "★★★☆☆");
		starRating.put(4, "★★★★☆");
		starRating.put(5, "★★★★★");

		model.addAttribute("list", reviewService.getReviewList(page, word, "admin"));
		model.addAttribute("starRating", starRating);
		model.addAttribute("pageManager", new com.kg.fieldluxe.util.PagingManager(reviewService.getReviewCount(word), page));
	}

	// 리뷰 목록
	@GetMapping("/reviewList")
	public String reviewList(String email, SearchVO search, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); //1 페이지 초기값
		
		List<ReviewVO> reviewList = reviewService.getReviewList2(email, search.getPage());
		pc.setProductTotalCount(reviewService.getReviewCount2(email)); //내 리뷰 갯수 구하기
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pc", pc);
		
		return "review/reviewList";
	}

	// 리뷰 등록 페이지 요청
	@GetMapping("/insertReview/{tradeId}")
	public String insertReview(@PathVariable int tradeId, Model model) {
		model.addAttribute("purchase", tradeService.getPurchaseDetail(tradeId));
		return "review/insert";
	}

	// 리뷰 등록 요청
	@PostMapping("/insertReview")
	public String insertReview(ReviewVO review) {
		reviewService.insertReview(review);
		return "redirect:/product/content/" + review.getProductId(); //상품 상세화면으로 가기
	}

	// 리뷰 수정 ajax 요청
	@ResponseBody
	@PostMapping("/updateReview")
	public String updateReview(@RequestBody ReviewVO review) {
		String result = "";
		boolean check = reviewService.updateReview(review);
		if(check) {
			System.out.println("리뷰 수정 성공");
			result = "updateSuccess";
		} else {
			System.out.println("리뷰 수정 실패");
			result = "updateFail";
		}
		return result;
	}

	// 리뷰 삭제 ajax 요청
	@ResponseBody
	@PostMapping("/deleteReview")
	public String deleteReview(@RequestBody int reviewId) {
		String result = "";
		boolean check = reviewService.deleteReview(reviewId);
		if(check) {
			System.out.println("리뷰 삭제 성공");
			result = "deleteSuccess";
		} else {
			System.out.println("리뷰 삭제 실패");
			result = "deleteFail";
		}
		return result;
	}

	// 프로필 리뷰 목록
	@GetMapping("/profileReviewList")
	public String profileReviewList(Model model, String email) {
		List<ReviewVO> list = reviewService.getProfileReviewList(email);
		model.addAttribute("profileReviewList", list);
		return "member/profileReviewList";
	}
}
