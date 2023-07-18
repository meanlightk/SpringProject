package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	/*@RequestParam("price") String price, @RequestParam("pname") String pname, @RequestParam("stock") int stock*/
//	@PostMapping(value = "/registerGoods", consumes = MediaType.APPLICATION_JSON_VALUE)	
	@PostMapping("/registerGoods")	
	@ResponseBody
	public Goods registerGoods(@RequestParam("price") String  price,@RequestParam("pname") String pname, @RequestParam("stock") String stock,
			@RequestParam("skintype") String skintype, @RequestParam("category") String category) {
		
		log.info("registerGoods");
		
		log.info(price); 
		log.info(pname); 
		log.info(stock); 
		log.info(skintype); 
		int stock2 = Integer.parseInt(stock);
		
		
		
		 Goods goods = new Goods();
		
		 int gno = service.getGno() + 1;
		 System.out.println("내가 보낸 gno:" + gno);
		 goods.setGno(gno);
		 goods.setPname(pname); 
		 goods.setStock(stock2); 
		 int realprice = Integer.parseInt(price); 
		 goods.setPrice(realprice);
		 service.registerItem(goods); 
		 
		 return goods;
		 
	}
	
	@GetMapping("/registerGoods2")
	public String registerGoods2() {
		log.info("register goods");
		return "registerGoods";
	}
	
}
