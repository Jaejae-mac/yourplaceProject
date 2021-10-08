package com.yourplace.custom.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.dao.LoginDAO;
import com.yourplace.custom.login.service.InsertCouponService;
import com.yourplace.custom.reservation.vo.CouponVO;

@Service("insertCouponService")
public class InsertCouponServiceImpl implements InsertCouponService {

	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public void welcomeCoupon(CouponVO vo) {
		loginDAO.welcomeCoupon(vo);
	}

}
