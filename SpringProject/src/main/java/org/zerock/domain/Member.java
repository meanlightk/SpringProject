package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String name;
	private String pwd;
	private String pnum;
	private String email;
	private int grade;
	private Date regidate;
	private Date updatedate;
	private String status;
}
