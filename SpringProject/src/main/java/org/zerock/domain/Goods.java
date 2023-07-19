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
	private Integer gno;
	private String category;
	private String pname;
	private String content;
	private Integer sellPrice;
	private String skintype;
	private Date regidate;
	private Date updatedate;
	private Integer stock;
	private String status;
	private String imagepath;
	private String simagepath;

	
	private Integer originalPrice;
	private Integer discountPrice;
	private String uuid;
}
