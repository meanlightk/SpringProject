package org.zerock.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.websocket.Session;

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
	
	// security?
	@PostMapping("/login.do")
	public String auth(Model model, Member member) {
		String pwd=member.getPwd();
		member.setPwd(sha256Hash(pwd));
		service.login(member);
		return null;
	}
	
	
	@GetMapping("/logout.do")
	public String logout() {
		Session session;
		return "redirect:/home";
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

	
	public static String sha256Hash(String input) {
	    try {
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(input.getBytes(StandardCharsets.UTF_8));
	
	        // 해시 값을 16진수 문자열로 변환
	        StringBuilder hexString = new StringBuilder();
	        for (byte b : hash) {
	            String hex = Integer.toHexString(0xff & b);
	            if (hex.length() == 1) {
	                hexString.append('0');
	            }
	            hexString.append(hex);
	        }
	
	        return hexString.toString();
	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
}
