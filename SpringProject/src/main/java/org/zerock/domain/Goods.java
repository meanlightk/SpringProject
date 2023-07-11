package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Goods {
	private int pno;
	private String category;
	private String pname;
	private int price;
	private String skintype;
}
