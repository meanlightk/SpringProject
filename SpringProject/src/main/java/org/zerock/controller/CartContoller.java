package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Cart;
import org.zerock.domain.Goods;
import org.zerock.dto.res.CartItem;
import org.zerock.service.CartService;

import lombok.extern.log4j.Log4j;

@Log4j 
@Controller
@RequestMapping("/cart")
public class CartContoller {
	@Autowired
	CartService cartService;
	
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	@GetMapping("/view")
	public String viewCart(Model model) {
		//로그인 유저 체크
		
		if(auth.getName() == null || auth.getName().equals("") || auth.getName().equals("anonymousUser")) {
			//미로그인 상태
			return "redirect:/login";
		}
		
		String userId = auth.getName();
		List<CartItem> cartList = cartService.getCartItemList(userId);
	
		model.addAttribute("cartItemList", cartList);
		return "cart"; 
	}
	
	@PostMapping("/putCart")
	public String putCart(@RequestParam("goods") Goods goods, @RequestParam("optionName") String optionName, @RequestParam("totalPrice") int totalPrice, @RequestParam("quantity") int quantity) {
		
		Cart cart = new Cart();
		String memid = auth.getName();
		cart.setMemid(memid);
		cart.setGoods_no(goods.getGno());
		cart.setOptionName(optionName);
		cart.setTotalPrice(totalPrice);
		cart.setQuantity(quantity);
		cart.setPname(goods.getPname());
		cartService.putCart(cart);
		return "redirect:/";
		
	}
}
