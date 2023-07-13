package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/")
@Controller
@Log4j
public class CommonController {
	
	@RequestMapping("/home")
	public String mainPage() {
		return "/main/home";
	}
	
	@RequestMapping("/product")
	public String product() {
		return "/product";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "/about/about";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "/contact/contact";
	}
	
	@RequestMapping("/bloglist")
	public String bloglist() {
		return "/blog/bloglist";
	}
	
	@RequestMapping("/blog")
	public String blog() {
		return "/blog/blog";
	}
}
