package com.yourplace.custom.question.dao;

import com.yourplace.custom.question.vo.QuestionVO;

public interface QuestionDAO {

	//1:1 문의하기 등록 처리 메서드 
	void guestQues(QuestionVO vo);
	
}
