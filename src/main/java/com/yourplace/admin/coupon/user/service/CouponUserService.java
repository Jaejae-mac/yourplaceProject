package com.yourplace.admin.coupon.user.service;

import com.yourplace.admin.coupon.user.vo.CouponUserVO;

public interface CouponUserService {

	void sendCoupon(CouponUserVO vo, String sendCoupName);
	void deleteUser(String couponNum);
}
