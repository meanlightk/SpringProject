package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Review;

public interface ReviewMapper {

	public List<Review> selectReviewList();

	
	public Review selectReviewById(int reviewNo);

	
	public int insertReview(Review review);

	
	public int deleteReview(int reviewNo);
	
	public int updateReview(Review review);

	

}
