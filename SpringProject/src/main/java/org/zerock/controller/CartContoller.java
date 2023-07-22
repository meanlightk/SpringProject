package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.dto.res.CartItem;
import org.zerock.service.CartService;

import lombok.extern.log4j.Log4j;

@Log4j 
@Controller
@RequestMapping("/cart/")
public class CartContoller {
	@Autowired
	CartService cartService;
	
	@GetMapping("/view")
	public String viewCart(Model model) {
		//로그인 유저 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth.getName() == null || auth.getName().equals("") || auth.getName().equals("anonymousUser")) {
			//미로그인 상태
			return "redirect:/login";
		}
		
		String userId = auth.getName();
		List<CartItem> cartList = cartService.getCartItemList(userId);
	
		model.addAttribute("cartItemList", cartList);
		return "cart"; 
	}

}
