package com.yourplace.admin.coupon.all.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.coupon.all.dao.CouponAllDAO;
import com.yourplace.admin.coupon.all.vo.CouponAllVO;

@Service("coupInsert")
public class InsertCouponServiceImpl implements InsertCouponService {

	@Autowired
	private CouponAllDAO couponDAO;
	
	@Override
	public void insertCoupon(CouponAllVO coupVO) {
		System.out.println("InsertCouponServiceImpl 실행");
		couponDAO.insertCoupon(coupVO);
	}

}
