package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Cart;

public interface CartMapper {

	public List<Cart> selectCart(String id);

	public void insertCart(Cart cart);

	public void deleteCart(Cart cart);

	public int selectCartCount(String id);

	public int updateCart(@Param("id") String id, @Param("cartNo") int cartNo, @Param("quantity") int quantity);
	
	public int updateCartOrderNo(@Param("memberId") String memberId, @Param("orderNo") int orderNo);
}
