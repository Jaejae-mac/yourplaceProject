package com.yourplace.admin.coupon.all.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.coupon.all.vo.CouponAllVO;

@Repository("couponDAO")
public class CouponAllDAOImpl implements CouponAllDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CouponAllVO> getCouponList() {
		System.out.println("---> MyBatis 로 getCouponList 기능 처리");
		return sqlSessionTemplate.selectList("CouponAllDAO.getCouponList");
	}

	@Override
	public void deleteCoupon(String deleteCoupName) {
		System.out.println("---> MyBatis 로 deleteCoupon 기능 처리");
		sqlSessionTemplate.delete("CouponAllDAO.deleteCoupon", deleteCoupName);
	}

	@Override
	public void insertCoupon(CouponAllVO coupVO) {
		System.out.println("---> MyBatis 로 insertCoupon 기능 처리");
		System.out.println("들어온 객체값 sysout: " + coupVO.toString());
		sqlSessionTemplate.insert("CouponAllDAO.insertCoupon", coupVO);
	}

	@Override
	public void deleteAllCoupon() {
		System.out.println("---> MyBatis 로 deleteAllCoupon 처리");
		sqlSessionTemplate.delete("CouponAllDAO.deleteAllCoupon");
	}



}
