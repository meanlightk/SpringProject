package org.zerock.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

import org.zerock.domain.Common;
import org.zerock.domain.OrderList;
import org.zerock.service.OrderService;


/*
 * �����ڿ� ��ǰ����
 * �������� �ù踦 �����ȣ�� �ù� �ڵ带 ����ϱ� ���� ���
 */

@RequestMapping("/track/")
@Controller
@Log4j
public class TrackController {
	
	@Autowired
	private OrderService orderService;

	@Value("${smartapi.key}")
	private String apikey;
	
	@RequestMapping("/main.do")
	public String main(Model model,Common common) {
		
		List<OrderList> list = orderService.getOrderList(common);
		
		model.addAttribute("orderList",list);
		
		return "/tracking/tracktest";
	}
	
	@RequestMapping("/list.do")
	public String goodslist(Model model, @RequestParam("orderlistNo") int orderlistNo) {

		Map<String,Object> info = orderService.getOrder(orderlistNo);
		
		model.addAttribute("info",info);
		
		model.addAttribute("key",apikey);

		
		return "tracking/tracklist";
	}
	
	
	@RequestMapping("/save")
	public void save() {
		
	}

	
	
	

	
	
}
