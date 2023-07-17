package org.zerock.domain;

import java.util.Date;
import java.util.List;
import java.util.Set;

import lombok.Data;

@Data
public class Member {
	private String username;
	private String name;
	private String pwd;
	private String pnum;
	private String email;
	private int grade;
	private Date regidate;
	private Date updatedate;
	private String status;
	private List<Authority> authList;
}
