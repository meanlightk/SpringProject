package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.dto.req.NewOrder;
import org.zerock.dto.req.UpdateCartItem;
import org.zerock.dto.res.AjaxRes;
import org.zerock.dto.res.PaymentItem;
import org.zerock.service.CartService;
import org.zerock.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/order/")
public class OrderController {
	@Autowired
	CartService cartService;

	@Autowired
	OrderService orderService;
	
	@PostMapping("new")
	public AjaxRes newOrder(@RequestBody NewOrder newOrder) {
		String id = null;
		
		// 로그인 유저 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName() == null || auth.getName().equals("") || auth.getName().equals("anonymousUser")) {
			// 미로그인 상태
			return AjaxRes.builder().status("FAIL").message("Not logged in").build();
		}
		
		id = auth.getName();
		PaymentItem paymentItem = orderService.newOrder(id, newOrder);
		if(paymentItem == null) {
		}
		
		return AjaxRes.builder().status("SUCCESS").data(paymentItem).build();
		
	}

	@PostMapping("updateCart")
	public AjaxRes updateCart(@RequestBody UpdateCartItem cartItem) {
		String id = null;
		
		// 로그인 유저 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getName() == null || auth.getName().equals("") || auth.getName().equals("anonymousUser")) {
			// 미로그인 상태
			return AjaxRes.builder().status("FAIL").message("Not logged in").build();
		}
		
		id = auth.getName();
		if(cartService.updateCart(id, cartItem)) {
			return AjaxRes.builder().status("SUCCESS").build();			
		} else {
			return AjaxRes.builder().status("FAIL").message("Cannot find user.").build();
	
		}
	}
}
