package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/")
@Controller
@Log4j
public class CommonController {
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/home";
	}
	
	@RequestMapping("/home")
	public String mainPage() {
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
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
}
