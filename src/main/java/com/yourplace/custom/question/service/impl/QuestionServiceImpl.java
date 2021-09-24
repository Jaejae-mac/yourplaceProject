package com.yourplace.custom.question.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.dao.LoginDAO;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.question.dao.QuestionDAO;
import com.yourplace.custom.question.service.QuestionService;
import com.yourplace.custom.question.vo.QuestionVO;


@Service("QuestionService")
public class QuestionServiceImpl implements QuestionService {

	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private LoginDAO logindao;
	
	@Override
	public void insertQues(QuestionVO vo) {
		
		questionDAO.guestQues(vo);
	}
	
	@Override
	public UserVO getUser(UserVO vo) {
		return logindao.getUser(vo);
	}

}
