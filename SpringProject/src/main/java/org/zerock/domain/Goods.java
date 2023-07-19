package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
	private int gno;
	private int category;
	private String pname;
	private String content;
	private int sellPrice;
	private int skintype;
	private Date regidate;
	private Date updatedate;
	private int stock;
	private int status;
	private String imagepath;
	private int originalPrice;
	private int discountPrice;
	private String uuid;
}
