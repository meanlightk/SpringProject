package org.zerock.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.Member;
import org.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/member/")
@Controller
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@PostMapping("/join")
	public String join(Member member) {
		service.join(member);
		return null;
	}
	
	@GetMapping("/profile")
	public String profile(Model model, String id) {
		Member member = new Member();
		service.memberInfo(id);
		model.addAttribute("member", member);
		return null;
	}
	
	@RequestMapping("/edit")
	public String edit(Member member) {
		service.editInfo(member);
		return null;
	}
	
	@RequestMapping("/farewell")
	public String farewell(String id) {
		service.withdrawal(id);
		return "redirect:/";
	}
}
