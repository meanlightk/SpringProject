package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QnA_A {
	private int qna_ansno; // pk
	private int qna_questno; // QnA 질문에 대한 foreign key
	private String id; // 유저아이디
	private String title;
	private String content;
	private Date regiDate;
	private Date updateDate;
	private String status;
}
