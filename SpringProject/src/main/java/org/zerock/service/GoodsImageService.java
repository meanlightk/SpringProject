package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.domain.GoodsImage;
import org.zerock.mapper.GoodsImageMapper;

public class GoodsImageService {
	
	@Autowired
	GoodsImageMapper mapper;

	public void insertGoodsImage(GoodsImage goodsImage) {
		
	}
}
