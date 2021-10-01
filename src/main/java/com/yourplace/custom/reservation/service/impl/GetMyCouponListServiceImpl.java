package com.yourplace.custom.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.GetMyCouponListService;
import com.yourplace.custom.reservation.vo.CouponVO;

@Service("getMyCouponListService")
public class GetMyCouponListServiceImpl implements GetMyCouponListService {

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public List<CouponVO> getMyCouponList(String userCoupId) {
		return rsvDAO.myCouponList(userCoupId);
	}

}
