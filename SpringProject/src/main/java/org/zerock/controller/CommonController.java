package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.GoodsService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/")
@Controller
@Log4j 
public class CommonController {
	
	@Autowired
	GoodsService service;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/home";
	}
	
	@RequestMapping("/home")
	public String mainPage(Model model) {
		model.addAttribute("goodsList",service.goodsList());
		return "home";
	}
	
	@RequestMapping("/list")
	public String goodslist() {
		return "itemlist";
	}
	
	@RequestMapping("/list/goods")
	public String goods() {
		return "item";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@RequestMapping("/blogs")
	public String bloglist() {
		return "blogs";
	}
	
	@RequestMapping("/blogs/blog")
	public String blog() {
		return "blog";
	}
	
	@GetMapping("/login")
	public String loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);
		
		return "/customlogin";
	}

	
//	@RequestMapping("/test")
//	public String test() {
//		return "test";
//	}
	
	@GetMapping("/review/form")
	public String reviewForm() {
		return "/review/form";
	}
	
	@RequestMapping("/sample/member")
	public String membersample() {
		return "/sample/member";
	}

}
