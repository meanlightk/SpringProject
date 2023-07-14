package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QnA_Q {
	private int qna_questno; // pk
	private String id;
	private String title;
	private String content;
	private Date regiDate;
	private Date updateDate;
	private String status;
}
