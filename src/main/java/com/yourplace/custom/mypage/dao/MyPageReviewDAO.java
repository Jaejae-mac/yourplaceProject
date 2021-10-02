package com.yourplace.custom.mypage.dao;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageGuestReviewVO;
import com.yourplace.custom.mypage.vo.MyPageHostReviewVO;

public interface MyPageReviewDAO {
	List<MyPageHostReviewVO> getReviewList(MyPageHostReviewVO vo);
	
	void insertGuestReview(MyPageGuestReviewVO vo);
	
	void deleteGuestReview(MyPageGuestReviewVO vo);
	
	void deleteHostReview(MyPageHostReviewVO vo);
}
