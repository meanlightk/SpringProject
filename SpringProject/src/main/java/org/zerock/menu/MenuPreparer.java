package org.zerock.menu;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.apache.tiles.request.servlet.ServletUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.mapper.MenuMapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
 
public class MenuPreparer implements ViewPreparer {
 
	@Autowired
	MenuMapper mapper;
 
	@Override
    public void execute(Request contextrequest, AttributeContext attributeContext) throws PreparerException {
        HttpServletRequest servletRequest = ServletUtil.getServletRequest(contextrequest).getRequest();
        String menu = servletRequest.getParameter("menu");
        List<MenuVO> list = mapper.selectMenuList(menu);
        attributeContext.putAttribute("menuList", new Attribute(list), true);
    }
 
}
