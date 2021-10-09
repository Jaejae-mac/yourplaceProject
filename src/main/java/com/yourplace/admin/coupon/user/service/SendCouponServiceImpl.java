package com.yourplace.admin.coupon.user.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.yourplace.admin.coupon.user.dao.CouponUserDAO;
import com.yourplace.admin.coupon.user.vo.CouponUserVO;

@Service("sendService")
public class SendCouponServiceImpl implements SendCouponService {

	@Autowired
	private CouponUserDAO couponUserDAO;
	
	@Override
	public List<CouponUserVO> checkCount(String couponNum) {
		System.out.println("[Service] 전달할 유저 count");
		List<CouponUserVO> list = couponUserDAO.checkCount(couponNum);
		return list;
	}

	@Override
	public List<CouponUserVO> checkId(String couponNum) {
		System.out.println("[Service] 전달할 유저 ID search");
		List<CouponUserVO> list = couponUserDAO.checkId(couponNum);
		System.out.println("[Service] 받은 id 조회: " + list.toString());
		return list;
	}
	
	@Override
	public void addCoupon(String num, Date startD, Date endD) {
		System.out.println("[Service] Add Coupon");
		
		//size: checkCount 만큼
		List<CouponUserVO> list = couponUserDAO.idMinus(num);
		int result = list.size();
		
		//print to console ----- TEST
		System.out.println("[Service] -------- TEST --------");
		System.out.println("result / size: " + result);
		System.out.println("list : " + list.toString());

		
		//세팅된 list로 돌리기
		for (int i = 0; i < (result); i++)
		{
			if(!ObjectUtils.isEmpty(list))
			{
				CouponUserVO vo = new CouponUserVO();
				
				String checkId = list.get(i).getUserCoupId();
				System.out.println(checkId);
				
				vo.setCoupNum(num);
				vo.setUserCoupId(checkId);
				vo.setUserCoupUseYn("N");
				vo.setCoupStartD(startD);
				vo.setCoupEndD(endD);
				
				System.out.println("[Service] Insert to DB");
				couponUserDAO.addCoupon(vo);
			} else
			{
				break;
			}
		}
		
		System.out.println("[Service] Insert to DB - DONE");

	}



}
