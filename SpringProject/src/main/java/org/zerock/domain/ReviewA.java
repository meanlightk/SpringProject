package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewA {

	private int answerNo;
	
	private int reviewNo;
	
	private String title;
	
	private String content;
		
	private Date regiDate;
	
	private String regiDateStr;
	
	private Date updateDate;
	
	private String updateDateStr;
	
}
