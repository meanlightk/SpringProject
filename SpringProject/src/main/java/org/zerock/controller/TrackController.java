package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

import org.zerock.domain.Common;
import org.zerock.domain.OrderList;
import org.zerock.service.OrderService;


/*
 * �����ڿ� ��ǰ����
 * �������� �ù踦 �����ȣ�� �ù� �ڵ带 ����ϱ� ���� ���
 */

@RequestMapping("/track/*")
@Controller
@Log4j
public class TrackController {
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("/main.do")
	public String main(Model model,Common common) {
		
		List<OrderList> list = orderService.getOrderList(common);
		
		model.addAttribute("orderList",list);
		
		return "/tracking/tracktest";
	}
	
	@RequestMapping("/list")
	public String goodslist() {
		return "itemlist";
	}
	
	
	@RequestMapping("/save")
	public void save() {
		
	}

	
	
	

	
	
}
