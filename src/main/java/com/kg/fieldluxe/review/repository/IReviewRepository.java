package com.kg.fieldluxe.review.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.review.model.ReviewVO;

public interface IReviewRepository {
	
	// 내 리뷰 목록
	List<ReviewVO> getReviewList(@Param("page")int page, @Param("word")String word, @Param("reviewTarget")String reviewTarget);
	
	// 내 리뷰 갯수
	Integer getReviewCount(@Param("word")String word);
	
	// 리뷰 한개 정보
	ReviewVO getReview(int reviewId);
	
	// 리뷰 입력
	int insertReview(ReviewVO review);
	
	// 리뷰 수정
	void updateReview(ReviewVO review);
	
	// 리뷰 삭제
	void deleteReview(int reviewId);
	
	// 프로필 리뷰 목록
	List<ReviewVO> getProfileReviewList(String email);

}
