package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AnswerClaim;

public interface AnswerClaimMapper {

	public List<AnswerClaim> selectClaimAnswers();
	
	public AnswerClaim selectOneClaimAnswer(int anscno);
	
	public void insertClaimAnswer(AnswerClaim AClaim);
	
	public void updateClaimStatus(AnswerClaim AClaim);	//주로 status를 업데이트용이나 제목 및 내용 수정 가능
	
	public void deleteClaimAnswer(int anscno);
}
