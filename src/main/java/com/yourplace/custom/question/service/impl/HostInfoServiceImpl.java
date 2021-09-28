package com.yourplace.custom.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.question.dao.QuestionDAO;
import com.yourplace.custom.question.service.HostInfoService;
import com.yourplace.custom.question.vo.HostInfoVO;


@Service("HostInfoService")
public class HostInfoServiceImpl implements HostInfoService {

	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	public List<HostInfoVO> hostInfoView(HostInfoVO vo) {
		System.out.println("[HostInfoServiceImpl]"+ vo.toString());
		return questionDAO.hostInfoView(vo);
	}

}
