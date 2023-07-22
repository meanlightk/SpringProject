package org.zerock.mapper;

import org.zerock.domain.OrderAddress;
import org.zerock.domain.OrderList;
import org.zerock.domain.OrderPayment;

public interface OrderListMapper {
	int insertOrder(OrderList orderList);
	
	int insertOrderPayment(OrderPayment orderPayment);
	
	int insertOrderAddress(OrderAddress orderAddress);
}
