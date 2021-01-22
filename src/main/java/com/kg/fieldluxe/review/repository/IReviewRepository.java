package com.kg.fieldluxe.review.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.review.model.ReviewVO;

public interface IReviewRepository {

	List<ReviewVO> getReviewList(@Param("page")int page, @Param("word")String word, @Param("reviewTarget")String reviewTarget);
	Integer getReviewCount(@Param("word")String word);
	public int insertReview(ReviewVO review);
	public boolean updateReview(ReviewVO review);
	public boolean deleteReview(@Param("reviewId")int reviewId);
	
	// 프로필 리뷰 목록
	List<ReviewVO> getProfileReviewList(String email);

}
