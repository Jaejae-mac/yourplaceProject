package com.yourplace.custom.reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.ClickedReviewService;
import com.yourplace.custom.reservation.vo.ReviewVO;

@Service("clickedReviewService")
public class ClickedReviewServiceImpl implements ClickedReviewService {

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public void clickedReview(ReviewVO vo) {
		if(vo.isHelpFlag()) {
			rsvDAO.deleteClickedReview(vo);
		}else {
			rsvDAO.insertClickedReview(vo);
		}
		
	}

}
