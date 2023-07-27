package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.GoodsImage;
import org.zerock.mapper.GoodsImageMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GoodsImageService {
	
	@Autowired
	GoodsImageMapper mapper;

	public void insertGoodsImage(GoodsImage goodsImage) {
		log.info("goodsImage insert");
		mapper.insert(goodsImage);
	}

	public List<GoodsImage> getImageList(int gno) {
		log.info("goodsImage insert");
		return mapper.findByGno(gno);
	}

	

}


