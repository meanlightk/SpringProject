package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.Adminclaim;
import org.zerock.domain.Common;
import org.zerock.service.AdminService;
import org.zerock.service.ClaimService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private ClaimService claimService;
	
	@RequestMapping("/mod")
	public String modPage() {
		
		return null;
	}
	
	@RequestMapping("/answer")
	public String answer() {
		return null;
	}

	@GetMapping("/claims")
	public String claimlist(Model model, Common common) {
		log.info("claimlist() called");
		List<Adminclaim> claimlist = claimService.showlistAll(common);
		model.addAttribute("claimlist", claimlist);
		model.addAttribute("section", common.getSection());
		model.addAttribute("pagenum", common.getPagenum());
		
		if(claimlist.size() > 0)
			model.addAttribute("tot", claimlist.get(0).getTotal());
		return "/claim/manageClaim";
	}
	
}
