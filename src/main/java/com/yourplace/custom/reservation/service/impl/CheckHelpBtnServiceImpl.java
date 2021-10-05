package com.yourplace.custom.reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.CheckHelpBtnUserService;
import com.yourplace.custom.reservation.vo.ReviewVO;

@Service("checkHelpBtnUserService")
public class CheckHelpBtnServiceImpl implements CheckHelpBtnUserService {
	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public ReviewVO checkHelpBtnUser(ReviewVO vo) {
		
		return rsvDAO.checkHelpBtnUser(vo);
	}

}
