package com.yourplace.custom.mypage.service;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageReviewVO;

public interface MyPageReviewService {
	List<MyPageReviewVO> getReviewList(MyPageReviewVO vo);
}
