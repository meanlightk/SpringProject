package org.zerock.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Goods {
	private int gno;
	private int category;
	private String pname;
	private int price;
	private int skintype;
	private Date regidate;
	private Date updatedate;
	private int stock;
	private int status;
}
