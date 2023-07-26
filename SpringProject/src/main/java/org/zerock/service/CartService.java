package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Cart;
import org.zerock.domain.Goods;
import org.zerock.dto.req.UpdateCartItem;
import org.zerock.dto.res.CartItem;
import org.zerock.mapper.CartMapper;
import org.zerock.mapper.GoodsMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartService {

	@Autowired
	private CartMapper mapper;
	@Autowired
	private GoodsMapper goodsMapper;

	public List<Cart> showCart(String id) {
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

	public void showCartCount(String memid) {
		log.info("-- cart count --");

	}

	/***
	 * ====================================================================================================
	 * 
	 * @author Jihyeon
	 */

	public List<CartItem> getCartItemList(String memberId) {
		List<CartItem> cartItemList = new ArrayList<>();

		List<Cart> cartList = mapper.selectCart(memberId);
		for (int i = 0; i < cartList.size(); i++) {
			Cart cart = cartList.get(i);
			Goods goods = goodsMapper.selectOneItem(cart.getGoods_no());

			CartItem cartItem = new CartItem();
			cartItem.setCartNo(cart.getCart_no());
			cartItem.setQuantity(cart.getQuantity());
			cartItem.setGoodsNo(cart.getGoods_no());
			cartItem.setGoodsName(goods.getPname());
			cartItem.setGoodsImage(goods.getImagepath());
			cartItem.setGoodsPrice(goods.getSellPrice());

			cartItemList.add(cartItem);
		}

		return cartItemList;
	}

	public boolean updateCart(String id, UpdateCartItem cartItem) {
		
		if(id == null || cartItem.getCartNo() == 0 || cartItem.getQuantity() == 0) {
			return false;
		}
		
		if(mapper.updateCart(id, cartItem.getCartNo(), cartItem.getQuantity()) < 1) {
			return false;
		}
		return true;
	}

}
