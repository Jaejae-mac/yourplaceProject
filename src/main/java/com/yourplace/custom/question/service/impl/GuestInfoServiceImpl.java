package com.yourplace.custom.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.question.dao.QuestionDAO;
import com.yourplace.custom.question.service.GuestInfoService;
import com.yourplace.custom.question.vo.GuestInfoVO;

@Service("GuestInfoService")
public class GuestInfoServiceImpl implements GuestInfoService {

	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	public List<GuestInfoVO> guestInfoView(GuestInfoVO vo) {
		System.out.println("[GuestInfoServiceImpl]"+ vo.toString());
		return questionDAO.guestInfoView(vo);
	}


}
