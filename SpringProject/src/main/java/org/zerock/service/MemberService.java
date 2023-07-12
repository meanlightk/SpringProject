package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Member;
import org.zerock.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	public void join(Member member) {
		memberMapper.insertMember(member);
	}
	
	public Member login(Member member) {
		return memberMapper.selectMemberaslogin(member);
	}
	
	public Member memberInfo(String id) {
		return memberMapper.selectMember(id);
	}

	public void editInfo(Member member) {
		memberMapper.updateMember(member);
	}
	
	public void withdrawal(String id) {
		memberMapper.deleteMember(id);
	}
}
