package com.yourplace.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.mypage.dao.MyPageReviewDAO;
import com.yourplace.custom.mypage.service.MyPageReviewService;
import com.yourplace.custom.mypage.vo.MyPageReviewVO;
@Service("MyPageReviewService")
public class MyPageReviewServiceImpl implements MyPageReviewService {
	@Autowired
	private MyPageReviewDAO dao;
	@Override
	public List<MyPageReviewVO> getReviewList(MyPageReviewVO vo) {
		return dao.getReviewList(vo);
	}

}
