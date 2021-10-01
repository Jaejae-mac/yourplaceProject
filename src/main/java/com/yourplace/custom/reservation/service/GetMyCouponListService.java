package com.yourplace.custom.reservation.service;

import java.util.List;

import com.yourplace.custom.reservation.vo.CouponVO;

public interface GetMyCouponListService {
	List<CouponVO> getMyCouponList(String userCoupId);
}
