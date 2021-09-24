package com.yourplace.admin.coupon.all.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.coupon.all.dao.CouponAllDAO;
import com.yourplace.admin.coupon.all.vo.CouponAllVO;

@Service("coupAllList")
public class CouponListServiceImpl implements CouponListService {

	@Autowired
	private CouponAllDAO couponDAO;
	
	@Override
	public List<CouponAllVO> getCouponList() {
		List<CouponAllVO> vo = couponDAO.getCouponList();
		return vo;
	}

}
