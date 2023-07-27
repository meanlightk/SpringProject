package org.zerock.menu;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.apache.tiles.request.servlet.ServletUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.zerock.mapper.CartMapper;
import org.zerock.mapper.MenuMapper;
 
public class MenuPreparer implements ViewPreparer {
 
	@Autowired
	MenuMapper mapper;
 
	@Autowired
	CartMapper cartMapper;
	@Override
    public void execute(Request contextrequest, AttributeContext attributeContext) throws PreparerException {
        HttpServletRequest servletRequest = ServletUtil.getServletRequest(contextrequest).getRequest();
        String menu = servletRequest.getParameter("menu");
        List<MenuVO> list = mapper.selectMenuList(menu);
        attributeContext.putAttribute("menuList", new Attribute(list), true);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        int cartCount = 0;
        try{
        	String memid = auth.getName();
        	if(!memid.equals("anonymousUser")) {
                cartCount = cartMapper.selectCartCount(memid);
        		System.out.println(cartCount);
        	}else {
        		cartCount = 0;
        	}
        	attributeContext.putAttribute("cartCount", new Attribute(cartCount), true);
        }catch(Exception e) {
        	
        }

    }
}
