package com.yourplace.custom.reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.HelpCntService;
import com.yourplace.custom.reservation.vo.ReviewVO;

@Service("helpCntService")
public class HelpCntServiceImpl implements HelpCntService {

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public void updateHelpCnt(ReviewVO vo) {
		rsvDAO.updateHelpCnt(vo);

	}

}
