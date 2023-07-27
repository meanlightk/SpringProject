package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Wish;

public interface WishMapper {
	
	public int insertWish(String memid, int gno);
	
	public int deleteWish(String memid, int gno);
	
	public List<Wish> selectWishList(String memid);

}
