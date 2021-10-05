package com.yourplace.custom.reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.GetHelpCnt;
import com.yourplace.custom.reservation.vo.ReviewVO;

@Service("getHelpCnt")
public class GetHelpCntImpl implements GetHelpCnt {

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public ReviewVO getHelpCnt(ReviewVO vo) {
		ReviewVO rtnHelpCnt = rsvDAO.getHelpCount(vo);
		return rtnHelpCnt;
	}

}
