package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Goods;
import org.zerock.service.GoodsService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	@GetMapping("/list")
	public void showItemList(Model model) {
		log.info("showItemList start...");
		
		//List<Goods> goodsList = service.showItemList();
		
		//model.addAttribute("goodsList", goodsList);
	}
	
	@GetMapping("/showItem")
	public String showOneItem(Model model) {
		
		log.info("showOneItem start....");
		
		//Goods good = service.showOneItem(pno);
		
		//model.addAttribute("good", good);
		
		return "item";
	}	
	
	@GetMapping("/put")
	public String putCart(Model model) {
		
		/*
		 * for(Goods good: goodsList) { service.putCart(good.getPno()); }
		 * 
		 * model.addAttribute("cartList", goodsList);
		 */
		
		return "cart/myCart"; 
	}
	
	/*
	 * @GetMapping("/delete/${pno}") public String removeCart(@RequestParam("pno")
	 * int pno, Model model) {
	 * 
	 * 
	 * }
	 */
	
	@GetMapping("/registerGoods")
	public void registerGoods() {
		log.info("registerGoods");
	}
	

}
