package com.yourplace.admin.question.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.question.dao.QuestionDAO;

@Service("updateService")
public class UpdateStatusServiceImpl implements UpdateStatusService {

	@Autowired
	private QuestionDAO queDAO;
	
	@Override
	public void updateStatus(int reprtSeq) {
		queDAO.updateStatus(reprtSeq);
	}

}
