package com.yourplace.custom.mypage.dao;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageReviewVO;

public interface MyPageReviewDAO {
	List<MyPageReviewVO> getReviewList(MyPageReviewVO vo);
}
