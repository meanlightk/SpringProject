package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.zerock.domain.Common;
import org.zerock.domain.Review;

public interface ReviewMapper {

	public List<Review> selectReviewList(Common common);

	
	public Review selectReviewById(int reviewNo);

	
	public int insertReview(Review review);

	
	public int deleteReview(int reviewNo);
	
	public int updateReview(Review review);

	

}
