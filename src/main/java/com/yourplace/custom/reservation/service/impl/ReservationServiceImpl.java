package com.yourplace.custom.reservation.service.impl;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.ReservationService;
import com.yourplace.custom.reservation.vo.CouponVO;
import com.yourplace.custom.reservation.vo.PaymentVO;
import com.yourplace.custom.reservation.vo.RsvVO;

@EnableTransactionManagement
@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private RsvDAO rsvDAO;
	private int[] timeline = {7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22};
	@Transactional
	@Override
	public synchronized int registReservation(RsvVO vo ,PaymentVO pvo) {
		//DB에 중복된 값이 없었다면 0을 리턴
		//DB에 중복된 값이 있었다면 1을 리턴.
		List<RsvVO> reservedList = rsvDAO.getReservation(vo);
		List<Integer> rsvedStartTime;
		List<Integer> rsvedEndTime;
		List<List<Integer>> reservedTimeAll;
		//예약된 내역이 존재한다면.
		if(reservedList != null) {
			rsvedStartTime = new ArrayList<Integer>();
			rsvedEndTime = new ArrayList<Integer>();
			reservedTimeAll = new ArrayList<List<Integer>>();
			for(RsvVO t : reservedList) {
				rsvedStartTime.add(t.getRsvStartT());
				rsvedEndTime.add(t.getRsvEndT());
			}
			for(int k = 0; k < rsvedStartTime.size(); k++) {
				List<Integer> timeIndex = new ArrayList<Integer>();
				for(int time = rsvedStartTime.get(k); time <= rsvedEndTime.get(k); time++) {
					timeIndex.add(time);
				}
				reservedTimeAll.add(timeIndex);
			}
			boolean flag = false;
			for(int num = 0; num < reservedTimeAll.size(); num++) {
				for(int temp : reservedTimeAll.get(num)) {
					for(int i = 0; i < timeline.length; i++) {
						if(timeline[i] == temp) {
							flag = true;
							return 1;
						}
					}
				}
			}
			if(!flag) {
				rsvDAO.insertReservation(vo);
				rsvDAO.insertPayment(pvo);
				if(!vo.getPayCoupNum().equals("none")) {
					CouponVO couponVO = new CouponVO();
					couponVO.setUserCoupId(vo.getUserId());
					couponVO.setCoupNum(vo.getPayCoupNum());
					rsvDAO.userCouponStateUpdate(couponVO);
					
				}
				return 0;
			}
		}
		System.out.println("coupnum : " + vo.getPayCoupNum());
		if(!vo.getPayCoupNum().equals("none")) {
			System.out.println("ININININININ");
			CouponVO couponVO = new CouponVO();
			couponVO.setUserCoupId(vo.getUserId());
			couponVO.setCoupNum(vo.getPayCoupNum());
			rsvDAO.userCouponStateUpdate(couponVO);
		}
		rsvDAO.insertReservation(vo);
		rsvDAO.insertPayment(pvo);
		return 0;
		
	}

}
