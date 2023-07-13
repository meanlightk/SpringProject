package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Cart;
import org.zerock.mapper.CartMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartService {
	
	@Autowired
	private CartMapper mapper;
	public List<Cart> showCart(String id){
		log.info("-- show cart --");
		return mapper.selectCart(id);
	}
	
	public void putCart(Cart cart) {
		log.info("-- insert cart --");
		mapper.insertCart(cart);
	}
	
	public void removeCart(Cart cart) {
		log.info("-- delete cart --");
		mapper.deleteCart(cart);
	}
}
