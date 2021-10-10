package com.yourplace.admin.question.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.question.dao.QuestionDAO;
import com.yourplace.admin.question.vo.AnswerVO;

@Service("insertAnswerService")
public class InsertAnswerServiceImpl implements InsertAnswerService {
	
	@Autowired
	private QuestionDAO queDAO;
	
	@Override
	public void insertAnswer(AnswerVO vo) {
		queDAO.insertAnswer(vo);
	}

}
