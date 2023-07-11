package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QnA {
	private Long pno; // pk
	private String id; // 유저아이디
	private String title;
	private String content;
	private Date regiDate;
	private Date updateDate;

}
