package com.kg.fieldluxe.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kg.fieldluxe.review.model.ReviewVO;
import com.kg.fieldluxe.review.repository.IReviewRepository;

@Service
public class ReviewService implements IReviewService{

	@Autowired
	@Qualifier("IReviewRepository")
	IReviewRepository reviewRepository;
	
	@Override
	public List<ReviewVO> getReviewList(int page, String word, String reviewTarget) {
		return reviewRepository.getReviewList(page, word, reviewTarget);
	}

	@Override
	public Integer getReviewCount(String word) {
		return reviewRepository.getReviewCount(word);
	}
	
	@Override
	public ReviewVO getReview(int reviewId) {
		return reviewRepository.getReview(reviewId);
	}

	@Override
	public int insertReview(ReviewVO review) {
		return reviewRepository.insertReview(review);
	}

	@Override
	public void updateReview(ReviewVO review) {
		reviewRepository.updateReview(review);
	}

	@Override
	public void deleteReview(int reviewId) {
		reviewRepository.deleteReview(reviewId);
	}
	
	@Override
	public List<ReviewVO> getProfileReviewList(String email) {
		List<ReviewVO> list = reviewRepository.getProfileReviewList(email);
		return list;
	}
	
}
