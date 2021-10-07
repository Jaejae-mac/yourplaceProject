package com.yourplace.admin.coupon.all.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

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
		
		//오늘 날짜
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String name = df.format(cal.getTime());
		
		//랜덤수 8자리 뽑기
		Random rand = new Random();
		String rst = Integer.toString(rand.nextInt(8) + 1);

		for(int i=0; i < 7; i++)
		{
			rst += Integer.toString(rand.nextInt(9));
		}
		Integer.parseInt(rst);

		//쿠폰 이름 만들기
		String num = "coup" + "-" + name + "-" + rst;
		coupVO.setCoupNum(num);
		
		couponDAO.insertCoupon(coupVO);
	}

}
