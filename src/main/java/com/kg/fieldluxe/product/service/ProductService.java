package com.kg.fieldluxe.product.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.product.model.ProductVO;
import com.kg.fieldluxe.product.repository.IProductMapper;
import com.kg.fieldluxe.review.model.ReviewVO;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	IProductMapper mapper;

	@Override
	public List<ListData> list(boolean check, String condition) {
		return mapper.selectAll(check, condition);
	}

	@Override
	public ProductVO detail(int id) {
		return new ProductVO(
				mapper.selectOneList(id),
				mapper.selectOneDeal(id),
				mapper.selectOneDetail(id));
	}

	@Override
	public void insert(ProductVO product) {
		mapper.insert(product.getListData());
		// 경매 입찰로 등록했을 경우 입찰금의 보증급 10% 입력
		if (product.getDealData().getDealMethod() != 1)
			product.getDealData().setAuctionDeposit((int) (product.getDealData().getMinAuctionPrice() * 0.1));
		mapper.insert(product.getDealData());
		mapper.insert(product.getDetailData());
		
	}

	@Override
	public void update(ProductVO product, char status, String rejectReason) {
		if (status == '0') { // 판매자가 검수 전 수정
			mapper.update(product.getListData());
			mapper.update(product.getDealData());
			mapper.update(product.getDetailData());
		} else if (status == '1') { // 관리자가 판매 등록
			System.out.println("status : " + status);
			product.getListData().setProductPostStatus(status);
			product.getListData().setProductPostDate(LocalDateTime.now());
			product.getListData().setAuctionEndDate(LocalDateTime.now().plusDays(7));
			product.getDealData().setAuctionStartDate(LocalDateTime.now());
			mapper.update(product.getListData());
			mapper.update(product.getDealData());
			mapper.update(product.getDetailData());
		} else if (status == '2') { // 관리자가 판매 거절
			System.out.println("status : " + status);
			product.getListData().setProductPostStatus(status);
			product.getDetailData().setRejectReason(rejectReason);
			mapper.update(product.getListData());
			mapper.update(product.getDealData());
			mapper.update(product.getDetailData());
		} else { // 단순 상태 변경 (배송 상태 혹은 경매 상태 등)
			mapper.update(product.getListData());
			mapper.update(product.getDealData());
			mapper.update(product.getDetailData());
		}
	}

	@Override
	public void delete(int id) {
		mapper.deleteList(id);
		mapper.deleteDeal(id);
		mapper.deleteDetail(id);
	}
	
	@Override
	public List<ListData> getProductList(SearchVO search) {
		List<ListData> list = mapper.getProductList(search);
		return list;
	}
	
	@Override
	public int getProductCount(SearchVO search) {
		return mapper.getProductCount(search);
	}
	
	@Override
	public List<ListData> getInspectList() {
		List<ListData> list = mapper.getInspectList();
		return list;
	}
	
	@Override
	public List<ListData> getProfileProductList(String email) {
		List<ListData> list = mapper.getProfileProductList(email);
		return list;
	}

	
	
}
