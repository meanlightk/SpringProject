package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/wish/*")
public class WishController {
	
	@PostMapping("/addwish")
	@ResponseBody
	public void addWish(@RequestBody int goods_no) {
		
		log.info("addWish controller 실행");
		
		
	}

}
