package org.zerock.mapper;

import java.util.List;

import org.zerock.menu.MenuVO;

public interface MenuMapper {

	
	public List<MenuVO> selectMenuList(String menuCd);
}
