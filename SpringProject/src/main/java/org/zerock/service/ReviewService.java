package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Review;
import org.zerock.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	
	public List<Review> getReviewList() {
		return reviewMapper.selectReviewList();
	}
	
	public Review getReview(int reviewNo) {
		return reviewMapper.selectReviewById(reviewNo);
	}
	
	public int insertReview(Review review) {
		return reviewMapper.insertReview(review);
	}

	public int deleteReview(int reviewNo) {
		return reviewMapper.deleteReview(reviewNo);
	}
	
	public int updateReview(Review review) {
		return reviewMapper.updateReview(review);
	}
}
