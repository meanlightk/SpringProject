package org.zerock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.Cart;
import org.zerock.dto.res.AjaxRes;
import org.zerock.dto.res.CartItem;
import org.zerock.service.CartService;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	@ResponseBody
	public void putCart(@RequestBody String jsonData, HttpServletResponse response) throws IOException {
		log.info("putcart 실행");

		
	    JSONParser jsonParser = new JSONParser();
	    log.info(jsonData.toString());
	    try {
			JSONObject insertParam = (JSONObject) jsonParser.parse(jsonData);
			String name = (String)insertParam.get("pname");
			log.info(name);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		AjaxRes res = AjaxRes.builder()
				.message("success").build();
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success!!!!");
		map.put("data", res);
		
		writer.print(map);
	}
}
