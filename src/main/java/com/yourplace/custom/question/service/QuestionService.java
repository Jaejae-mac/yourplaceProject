package com.yourplace.custom.question.service;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.question.vo.QuestionVO;

public interface QuestionService {

	void insertQues(QuestionVO vo);
	
	UserVO getUser(UserVO vo);
}
