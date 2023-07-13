package org.zerock.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Cart {
	private int cno;
	private String memid;
	private int gno;
	private int ordernum;
	private Date regidate;
}
