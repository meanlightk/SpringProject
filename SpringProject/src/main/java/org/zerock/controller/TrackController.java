package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

import org.zerock.service.ReviewService;


@RequestMapping("/track/*")
@Controller
@Log4j
public class TrackController {
	
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		
		
		return "/tracking/tracktest";
	}
	
	@RequestMapping("/list")
	public String goodslist() {
		return "itemlist";
	}
	
}
