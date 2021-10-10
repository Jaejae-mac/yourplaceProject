package com.yourplace.admin.question.dao;

import java.util.List;

import com.yourplace.admin.question.vo.AnswerVO;
import com.yourplace.admin.question.vo.QuestionVO;

public interface QuestionDAO {

	List<QuestionVO> getQue();
	
	void updateStatus(int reprtSeq);
	
	//답변내용을 DB에서 가지고 올 DAO method.
	List<AnswerVO> getAns();
	
	void insertAnswer(AnswerVO vo);
	
}
