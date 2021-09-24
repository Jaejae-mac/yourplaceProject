package com.yourplace.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.question.dao.QuestionDAO;
import com.yourplace.admin.question.vo.QuestionVO;

@Service("queService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDAO queDAO; 
	
	@Override
	public List<QuestionVO> getQue() {
		List<QuestionVO> list = queDAO.getQue();
		return list;
	}

}
