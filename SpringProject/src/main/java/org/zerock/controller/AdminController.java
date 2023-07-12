package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.AdminService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/mod")
	public String modPage() {
		
		return null;
	}
	
	@RequestMapping("/answer")
	public String answer() {
		return null;
	}
}
