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
	private String option_name;
	private int quantity;
}
