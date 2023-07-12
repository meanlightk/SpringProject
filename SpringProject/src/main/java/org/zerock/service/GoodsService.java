package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Goods;
import org.zerock.mapper.GoodsMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GoodsService {
	
	@Autowired
	private GoodsMapper mapper;
	
	public Goods showOneItem(int pno) {
		
		log.info("get one item......");
		return mapper.findOne(pno);
	}
	
	public List<Goods> showItemList(){
		
		log.info("show item list....");
		return mapper.findGoods();
	}
	
	public void putCart(int pno) {
		
		log.info("cart insert....");
		mapper.insertCart(pno);
	}
	
	public void removeGoods(int pno) {
		
		log.info("cart remove.....");
		mapper.deleteCart(pno);
	}
}
