package com.yourplace.admin.coupon.user.service;

import java.util.Date;
import java.util.List;

import com.yourplace.admin.coupon.user.vo.CouponUserVO;

public interface SendCouponService {

	List<CouponUserVO> checkCount(String couponNum);
	
	List<CouponUserVO> checkId(String couponNum);
	
	void addCoupon(String num, Date startD, Date endD);
	
}
