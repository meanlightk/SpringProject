package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Goods;

public interface GoodsMapper {
	
	public Goods selectOneItem(int gno);
	
	public List<Goods> selectListByCategory(int category);
	
	public List<Goods> selectListByCateAndSkin(Goods goods);
	
	public void insertItem(Goods goods);
	
	public void updateItem(Goods goods);
	
	public void deleteItem(int gno);
	
	public void selectImageList(int gno); //상품목록을 불러올 때 불러올 이미지리스트
	
	public int getGoodsNo();
	
	public List<Goods> goodsList();
}
