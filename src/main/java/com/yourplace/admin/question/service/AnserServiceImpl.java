package com.yourplace.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.question.dao.QuestionDAO;
import com.yourplace.admin.question.vo.AnswerVO;

@Service("answerService")
public class AnserServiceImpl implements AnswerService {

	@Autowired
	private QuestionDAO queDAO;
	
	@Override
	public List<AnswerVO> getAns() {
		return queDAO.getAns();
	}

}
