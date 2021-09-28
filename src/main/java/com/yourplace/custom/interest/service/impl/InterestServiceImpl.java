package com.yourplace.custom.interest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.interest.dao.InterestDAO;
import com.yourplace.custom.interest.service.InterestService;
import com.yourplace.custom.interest.vo.InterestVO;

@Service("InterestService")
public class InterestServiceImpl implements InterestService {

	@Autowired
	private InterestDAO interestDAO;
	
	@Override
	public List<InterestVO> interestView(InterestVO vo) {
		System.out.println("[InterestServiceImpl]"+ vo.toString());
		return interestDAO.interestView(vo);
	}

}
