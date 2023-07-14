package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.QnA_A;
import org.zerock.domain.QnA_Q;

public interface QnAMapper {

	// 전체 조회
	List<QnA_A> selectAllListByQnA_a(QnA_A qna_a);
	
	
	// 사용자
	QnA_Q selectOneQna_q(int QnA_q); // 상세 조회
	public QnA_Q selectQna_q(int qna_questno); // 조회
	public void insertQna_q(QnA_Q qna_q); // 작성
	public void updateQna_q(QnA_Q qna_q); // 수정
	public void deleteQna_q(int qna_questno); // 삭제

	// 관리자 댓글
	QnA_A selectOneQna_a(int QnA_a); // 상세 조회
	public void insertQna_a(QnA_A qna_a); // 작성
	public void updateQna_a(QnA_A qna_a); // 수정
	public void deleteQna_a(QnA_A qna_a); // 삭제

}
