package com.yourplace.admin.coupon.all.dao;

import java.util.List;

import com.yourplace.admin.coupon.all.vo.CouponAllVO;

public interface CouponAllDAO {

	//쿠폰 리스트 전체 조회
	List<CouponAllVO> getCouponList();
	
	//회원 삭제 (일부 또는 전체)
	void deleteCoupon(String deleteCoupName);

	//쿠폰 등록
	void insertCoupon(CouponAllVO coupVO);
	

	
}
