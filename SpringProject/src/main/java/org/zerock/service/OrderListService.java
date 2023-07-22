package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Common;
import org.zerock.domain.OrderList;
import org.zerock.mapper.OrderListMapper;

@Service
public class OrderListService {
	@Autowired
	private OrderListMapper orderMapper;
	
	
	public List<OrderList> getOrderList(Common common) {
		return orderMapper.selectOrderList(common);
	}
	
	public OrderList getOrder(int orderlistNo) {
		return orderMapper.selectOrderId(orderlistNo);
	}
	
	public int save(OrderList order) {
		if(order.getOrderlist_no() == 0)
			return orderMapper.insertOrderList(order);
		else
			return orderMapper.updateOrderList(order);

	}

	public int removeOrderList(int orderlistNo) {
		return orderMapper.deleteOrderList(orderlistNo);
	}
	
	public int updateWayData(OrderList order) {
		return orderMapper.updateWaybillData(order);
	}
}
