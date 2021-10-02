package com.yourplace.custom.mypage.service;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageCouponVO;

public interface MyPageCouponService {
	List<MyPageCouponVO> getCouponList(MyPageCouponVO vo);
	
	void deleteCoupon(MyPageCouponVO vo);
}
