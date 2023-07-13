package org.zerock.domain;

import lombok.Data;

@Data
public class Member {
	private String name;
	private String id;
	private String pwd;
	private String pnum;
	private String email;
	private int grade;
}
