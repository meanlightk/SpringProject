package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@PostMapping("/join")
	public String join() {
		service.join();
		return null;
	}
	
	@RequestMapping("/profile")
	public String profile() {
		service.memberInfo();
		return null;
	}
	
	public void edit() {
		service.editInfo();
	}
	
	public void bye() {
		service.withdrawal();
	}
}
