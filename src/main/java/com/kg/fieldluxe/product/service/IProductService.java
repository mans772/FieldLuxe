package com.kg.fieldluxe.product.service;

import java.util.List;

import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.product.model.ProductVO;
import com.kg.fieldluxe.review.model.ReviewVO;

public interface IProductService {
	
	// 목록
	List<ListData> list(boolean check, String condition);
	
	// 상세 보기
	ProductVO detail(int id);
	
	// 물품 등록
	void insert(ProductVO product);
	
	// 물품 수정
	void update(ProductVO product, char status, String rejectReason);
	
	// 물품 삭제
	void delete(int id);
	
	// 상품 전체 목록 (검색 포함)
	List<ListData> getProductList(SearchVO search);
	
	// 상품 전체 갯수 (검색 포함)
	int getProductCount(SearchVO search);
	
	// 상품 검수 목록
	List<ListData> getInspectList();
	
	// 프로필 상품 목록
	List<ListData> getProfileProductList(String email);

	
}
