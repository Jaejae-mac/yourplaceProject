package com.yourplace.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.mypage.dao.CouponDAO;
import com.yourplace.custom.mypage.service.MyPageCouponService;
import com.yourplace.custom.mypage.vo.MyPageCouponVO;


@Service("myPageCouponService")
public class MyPageCouponServiceImpl implements MyPageCouponService {
	@Autowired
	private CouponDAO dao;
	
	@Override
	public List<MyPageCouponVO> getCouponList(MyPageCouponVO vo) {
		return dao.getCouponList(vo);
	}
	
	@Override
	public void deleteCoupon(MyPageCouponVO cvo) {
		dao.deleteCoupon(cvo);
	}

}
