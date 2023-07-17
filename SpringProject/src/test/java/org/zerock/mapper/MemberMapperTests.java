package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Member;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testSelectMember() {
		Member member = mapper.selectMember("admin");
		log.info(member);
	}
	
//	@Test
//	public void testInsertMember() {
//		Member member = new Member();
//		String id = "test1";
//		String pwd = "12345";
//		String name = "tester1";
//		String pnum = "01022222222";
//		String email = "tester@test.com";
//		member.setEmail(email);
//		member.setId(id);
//		member.setName(name);
//		member.setPnum(pnum);
//		member.setPwd(pwd);
//		mapper.insertMember(member);
//	}
	
	@Test
	public void testUpdateMember() {
		String id = "admin";
		String pwd = "12345";
		String pnum = "01011111111";
		String email = "admin1@test.com";
		Member member=new Member();
		member.setId(id);
		member.setPwd(pwd);
		member.setPnum(pnum);
		member.setEmail(email);
		mapper.updateMember(member);
		log.info(member);
	}
	
	@Test
	public void testDeleteMember() {
		mapper.deleteMember("test1");
	}
}
