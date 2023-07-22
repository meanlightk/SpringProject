package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Adminclaim;
import org.zerock.domain.AnswerClaim;
import org.zerock.domain.Common;
import org.zerock.domain.Gclaim;

public interface GclaimMapper {

	/* gclaim n answer_gclaim */
	public List<Adminclaim> selectClaims(Common common);
	
	/* gclaim table */
	public List<Gclaim> selectGclaims();
	
	public Gclaim selectOneGclaim(int glno);
	
	public void insertGclaim(Gclaim claim);
	
	public void updateGclaim(Gclaim claim);
	
	public void deleteGclaim(int glno);
	
	
	/* answer_gclaim table */
	public List<AnswerClaim> selectClaimAnswers();
	
	public AnswerClaim selectOneClaimAnswer(int anscno);
	
	public void insertClaimAnswer(AnswerClaim AClaim);
	
	public void updateClaimStatus(AnswerClaim AClaim);
	
	public void deleteClaimAnswer(int anscno);
}
