package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.GoodsImage;

public interface GoodsImageMapper {
	
	public void insert(GoodsImage vo);
	
	public void delete(String uuid);
	
	public List<GoodsImage> findByGno(int gno);
		
}
