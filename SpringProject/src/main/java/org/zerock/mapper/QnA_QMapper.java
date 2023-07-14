package org.zerock.mapper;

import org.zerock.domain.QnA_A;
import org.zerock.domain.QnA_Q;

public interface QnA_QMapper {
	
	// 전체 조회


	
	// 사용자
	public QnA_Q selectQna_q(int qna_questno); // 조회
	public void insertQna_q(QnA_Q qna_q); // 작성
	public void updateQna_q(QnA_Q qna_q); // 수정
	public void deleteQna_q(int qna_questno); // 삭제
	QnA_Q selectOneQna_q(int Qna_q); // 특정 하나 삭제

	
	// 관리자 댓글
	public void insertQna_a(QnA_A qna_a); // 작성
	public void updateQna_a(QnA_A qna_a); // 수정
	public void deleteQna_a(String id); // 삭제
	QnA_A selectOneQna_a(int Qna_a); // 특정 하나 삭제

}
