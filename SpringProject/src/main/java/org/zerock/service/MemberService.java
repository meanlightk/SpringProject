package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	public void join() {
		memberMapper.insertMember();
	}
	
	public void login() {
		memberMapper.selectMember();
	}
	
	public void memberInfo() {
		memberMapper.selectMember();
	}

	public void editInfo() {
		memberMapper.updateMember();
	}
	
	public void withdrawal() {
		memberMapper.deleteMember();
	}
}
