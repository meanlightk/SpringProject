package org.zerock.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int cart_no;
	private String memid;
	private int goods_no;
	private int ordernum;
	private Date regidate;
	private int quantity;
	private String optionName;  //추가(옵션 이름)
	private int totalPrice;  //추가(총가격)
	private String pname;  //추가(상품 이름)
}
