package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Goods;

public interface GoodsMapper {
	
	public Goods findOne(int pno);
	
	public List<Goods> findGoods(int pno);
	
	public int insertCart(int pno);
	
	public int deleteCart(int pno);
	
}
