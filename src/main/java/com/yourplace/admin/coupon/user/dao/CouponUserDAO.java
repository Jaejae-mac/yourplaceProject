package com.yourplace.admin.coupon.user.dao;

import com.yourplace.admin.coupon.user.vo.CouponUserVO;

public interface CouponUserDAO {

	//쿠폰 전송
	void sendCoupon(CouponUserVO vo, String sendCoupName);
	
	//쿠폰 재발급
	void reInsertCoupon(String coupNum, String userId);
	
}
