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
	
	public Goods showOneItem(int gno) {
		log.info("-- show one item --");
		return mapper.selectOneItem(gno);
	}
	
	public List<Goods> showListByCategory(int category){
		log.info("-- show item list by category --");
		return mapper.selectListByCategory(category);
	}
	
	public List<Goods> showListByCateAndSkin(int category, int skintype){
		log.info("-- show item list by category and skin-type --");
		return mapper.selectListByCateAndSkin(category, skintype);
	}
	
	public void registerItem(Goods goods) {
		log.info("-- insert goods --");
		mapper.insertItem(goods);
	}
	
	public void modifyItem(Goods goods) {
		log.info("-- update goods --");
		mapper.updateItem(goods);
	}
	
	public void deleteItem(Goods goods) {
		log.info("-- delete goods --");
		mapper.deleteItem(goods);
	}
	
	public void callImageList(int gno) {
		log.info("-- call image list -- ");
		mapper.selectImageList(gno);
	}
}
