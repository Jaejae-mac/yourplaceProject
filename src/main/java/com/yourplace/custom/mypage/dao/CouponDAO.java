package com.yourplace.custom.mypage.dao;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageCouponVO;

public interface CouponDAO {
	List<MyPageCouponVO> getCouponList(MyPageCouponVO vo);
	
	void deleteCoupon(MyPageCouponVO vo);
}
