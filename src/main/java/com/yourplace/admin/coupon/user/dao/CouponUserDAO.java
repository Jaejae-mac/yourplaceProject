package com.yourplace.admin.coupon.user.dao;

import java.util.List;

import com.yourplace.admin.coupon.user.vo.CouponUserVO;

public interface CouponUserDAO {

	//쿠폰 전송
	void sendCoupon(CouponUserVO vo, String sendCoupName);
	
	//쿠폰 재발급
	void reInsertCoupon(String coupNum, String userId);
	
	//////////////////////////////////
	
	List<CouponUserVO> idMinus(String couponNum);
	
	List<CouponUserVO> checkCount(String couponNum);
	
	List<CouponUserVO> checkId(String couponNum);
	
	void addCoupon(CouponUserVO vo);
	
	
	int checkCountInt(String couponNum);
	
	
	
}
