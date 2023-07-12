package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Goods;

public interface GoodsMapper {
	
	public Goods findOne(int pno);
	
	public List<Goods> findGoods();
	
	public void insertCart(int pno);
	
	public void deleteCart(int pno);
		
}
