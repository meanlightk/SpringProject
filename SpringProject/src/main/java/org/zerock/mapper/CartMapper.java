package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Cart;

public interface CartMapper {
	
	public List<Cart> selectCart(String id);
	
	public void insertCart(Cart cart);
	
	public void deleteCart(Cart cart);
}
