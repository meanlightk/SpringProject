package org.zerock.domain;

import lombok.Data;

@Data
public class Common {

	private int section = 1;
	
	private int pageNum = 1;
	
	private String searchId;

	private String searchText;

	private int no;

	
}
