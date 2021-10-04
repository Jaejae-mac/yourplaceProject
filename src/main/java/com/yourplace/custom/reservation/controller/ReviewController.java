package com.yourplace.custom.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yourplace.custom.reservation.service.ReviewService;
import com.yourplace.custom.reservation.vo.ReviewVO;

@RestController
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	//리뷰 더보기.
	@ResponseBody
	@GetMapping("/moreReviews.do")
	public List<ReviewVO> additionalReviews(ReviewVO vo){
		List<ReviewVO> moreReviewList = reviewService.reviewList(vo);
		vo.setLastRowNum(vo.getLastRowNum() + 5);
		return moreReviewList;
	}
}
