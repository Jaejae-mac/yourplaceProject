package com.yourplace.admin.coupon.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.coupon.all.vo.CouponAllVO;
import com.yourplace.admin.coupon.user.dao.CouponUserDAO;
import com.yourplace.admin.coupon.user.vo.CouponUserVO;

@Service("coupUserSend")
public class CouponUserServiceImpl implements CouponUserService {

	@Autowired
	private CouponUserDAO couponUserDAO;
	
	@Override
	public void sendCoupon(CouponUserVO vo, String sendCoupName) {
		
		System.out.println("Coupon User Service 실행");
		couponUserDAO.sendCoupon(vo, sendCoupName);
		
	}
}
