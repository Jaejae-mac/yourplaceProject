package com.yourplace.admin.coupon.all.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.coupon.all.dao.CouponAllDAO;
import com.yourplace.admin.coupon.all.vo.CouponAllVO;

@Service("coupDelete")
public class DeleteCouponServiceImpl implements DeleteCouponService {
		
		@Autowired
		private CouponAllDAO couponDAO;
		
		@Override
		public void deleteCoupon(String deleteCoupName) {
			couponDAO.deleteCoupon(deleteCoupName);
		}

		@Override
		public void deleteAllCoupon() {
			couponDAO.deleteAllCoupon();
			
		}

}