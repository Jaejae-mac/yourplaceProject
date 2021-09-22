package com.yourplace.admin.coupon.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.coupon.user.vo.CouponUserVO;

@Repository("couponUserDAO")
public class CouponUserDAOImpl implements CouponUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void sendCoupon(CouponUserVO vo, String sendCoupName) {
		
		System.out.println("---> MyBatis 로 sendCoupon 기능 처리");
		sqlSessionTemplate.insert("CouponUserDAO.insertCouponUser", vo);
		sqlSessionTemplate.update("CouponUserDAO.updateCouponUser", sendCoupName);
		sqlSessionTemplate.update("CouponUserDAO.updateCouponList", vo);
		
	}

	
	


}
