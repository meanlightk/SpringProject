package org.zerock.mapper;

import org.zerock.domain.Authority;
import org.zerock.domain.Member;

public interface MemberMapper {
	
	public Member selectMemberaslogin(String id);
	
	public Member selectMember(String id);
	
	public int selectbyidCheck(String id);
	
	public void insertMember(Member member);
	
	public void insertAuth(Authority auth);
	
	public void updateMember(Member member);
	
	public void deleteMember(String id);

}
