package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private int rno;
	private String id;
	private int pno;
	private String title;
	private String content;
	private int score;
	private Date regiDate;
	private Date updateDate;
}
