package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Product_Review {

	private Long pno; // pk
	private String id; // 유저아이디
	private String title;
	private String content;
	private int score; // 평점
	private Date regiDate;
	private Date updateDate;
}
