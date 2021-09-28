package com.yourplace.custom.question.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.question.dao.QuestionDAO;
import com.yourplace.custom.question.service.ReportService;
import com.yourplace.custom.question.vo.QuestionVO;


@Service("ReportService")
public class ReportServiceImpl implements ReportService {

	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	public void insertReport(QuestionVO vo) {
		
		questionDAO.guestReport(vo);

		
	}


}
