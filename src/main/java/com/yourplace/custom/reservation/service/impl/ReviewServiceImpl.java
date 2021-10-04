package com.yourplace.custom.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.ReviewService;
import com.yourplace.custom.reservation.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public List<ReviewVO> reviewList(ReviewVO vo) {
		return rsvDAO.reviewList(vo);
	}

}
