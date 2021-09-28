package com.yourplace.custom.mypage.service;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageGuestReviewVO;
import com.yourplace.custom.mypage.vo.MyPageHostReviewVO;

public interface MyPageReviewService {
	List<MyPageHostReviewVO> getReviewList(MyPageHostReviewVO vo);
	
	void insertGuestReview(MyPageGuestReviewVO vo);
}
