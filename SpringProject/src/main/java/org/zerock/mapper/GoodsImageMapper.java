package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.GoodsImage;

public interface GoodsImageMapper {
		
	public List<GoodsImage> selectImgs(int ino);
	
	public void insertImg(GoodsImage images);
	
	public void updateImg();
	
	public void deleteImg(int ino);
}
