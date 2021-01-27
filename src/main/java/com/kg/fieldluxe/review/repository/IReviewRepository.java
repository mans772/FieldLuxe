package com.kg.fieldluxe.review.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.review.model.ReviewVO;
import com.kg.fieldluxe.trade.model.CollaboVO;

public interface IReviewRepository {

	// 내 리뷰 목록
	List<ReviewVO> getReviewList(@Param("page")int page, @Param("word")String word, @Param("reviewTarget")String reviewTarget);

	// 내 리뷰 갯수
	Integer getReviewCount(@Param("word")String word);

	// 내 리뷰 목록2
	List<ReviewVO> getReviewList2(@Param("email") String email, @Param("page") int page);

	// 내 리뷰 갯수2
	int getReviewCount2(@Param("email") String email);

	// 리뷰 한개 정보
	ReviewVO getReview(int productId);

	// 리뷰 입력
	int insertReview(ReviewVO review);

	// 리뷰 수정
	boolean updateReview(@Param("review") ReviewVO review);

	// 리뷰 삭제
	boolean deleteReview(int reviewId);

	// 프로필 리뷰 목록
	List<ReviewVO> getProfileReviewList(String email);

}
