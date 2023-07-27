package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Cart;
import org.zerock.domain.Common;
import org.zerock.domain.Goods;
import org.zerock.domain.OrderAddress;
import org.zerock.domain.OrderList;
import org.zerock.dto.req.NewOrder;
import org.zerock.dto.res.PaymentItem;
import org.zerock.mapper.CartMapper;
import org.zerock.mapper.GoodsMapper;
import org.zerock.mapper.OrderListMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderService {
	@Autowired
	OrderListMapper orderMapper;

	@Autowired
	CartMapper cartMapper;

	@Autowired
	GoodsMapper goodsMapper;

	@Transactional
	public PaymentItem newOrder(String memberId, NewOrder newOrder) {
		int totalAmount = 0;

		List<Cart> cartList = cartMapper.selectCart(memberId);
		for (int i = 0; i < cartList.size(); i++) {
			Cart cart = cartList.get(i);
			Goods goods = goodsMapper.selectOneItem(cart.getGoods_no());

			totalAmount += (goods.getSellPrice() * cart.getQuantity());
		}
		//배송비 추가
		totalAmount += 3500;
		
		log.debug("totalAmount::" + totalAmount);

		// 1. 주문 등록
		OrderList orderList = new OrderList();
		orderList.setMem_id(memberId);
		orderList.setTotprice(totalAmount);

		if (orderMapper.insertOrder(orderList) < 1) {
			return null;
		}

		// 2. 배송지 등록
		OrderAddress orderAddress = new OrderAddress();
		orderAddress.setOrder_no(orderList.getOrderlist_no());
		orderAddress.setName(newOrder.getName());
		orderAddress.setPhone(newOrder.getPhone());
		orderAddress.setAddr1(newOrder.getAddr1());
		orderAddress.setAddr2(newOrder.getAddr2());
		orderAddress.setMemo(newOrder.getMemo());

		if (orderMapper.insertOrderAddress(orderAddress) < 1) {
			return null;
		}
		
		//3. 장바구니 업데이트
		if(cartMapper.updateCartOrderNo(memberId, orderList.getOrderlist_no()) < 1) {
			return null;
		}

		return PaymentItem.builder().orderNo(orderList.getOrderlist_no()).totalPrice(totalAmount).build();
	}
	

	
	public List<OrderList> getOrderList(Common common) {
		return orderMapper.selectOrderList(common);
	}
	
	public Map<String,Object> getOrder(int orderlistNo,int gno) {
		return orderMapper.selectOrderId(orderlistNo,gno);
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
