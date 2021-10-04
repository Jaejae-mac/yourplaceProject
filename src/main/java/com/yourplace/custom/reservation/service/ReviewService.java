package com.yourplace.custom.reservation.service;

import java.util.List;

import com.yourplace.custom.reservation.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(ReviewVO vo);
}
