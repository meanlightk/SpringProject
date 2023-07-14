package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

import org.zerock.service.ReviewService;


@RequestMapping("/review/*")
@Controller
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/save.do")
	public String review(Model model) {
		
		model.addAttribute("list", reviewService.getReviewList());
		
		return "home";
	}
	
	
	@RequestMapping("/form.do")
	public String form(Model model) {
		
		return "/review/form";
	}

	
	
	@RequestMapping("/remove.do")
	public String remove(Model model,@RequestParam("reviewNo") int reviewNo) {
		
		return "redirect://";
	}
	
	
	
	
}
