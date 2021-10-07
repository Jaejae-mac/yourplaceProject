package com.yourplace.admin.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.coupon.user.dao.CouponUserDAO;
import com.yourplace.admin.payment.dao.PaymentDAO;
import com.yourplace.admin.payment.vo.PaymentVO;

@Service("refundService")
public class RefundProcessServiceImpl implements RefundProcessService {

	@Autowired
	private PaymentDAO paymentDAO;
	
	@Autowired
	private CouponUserDAO couponUserDAO;
	
	@Override
	public void refundDone(String orderNum) {
		System.out.println("[Service] refund 상태변경 : 2");
		paymentDAO.refundDone(orderNum);
	}

	@Override
	public void refundCoupon(String orderNum) {
		System.out.println("[Service] 쿠폰 재발급을 위한 사용한 쿠폰번호와 유저아이디 조회");
		
		PaymentVO vo = new PaymentVO();
		vo = paymentDAO.refundCoupon(orderNum);
		
		
		String coupNum = vo.getPayCoupNum();
		String id = vo.getUserId();
		
		System.out.println("CoupNum, id 찍어보기: " + coupNum + " " + id);

		//coupNum 이 null 이 아니면 실행
		if(coupNum == null)
		{
			System.out.println("[Service] 쿠폰 사용하지 않았기 때문에 재발급 없음");
		} else 
		{
			System.out.println("[Service] 쿠폰 재발급을 위해 couponDAO 호출");
			couponUserDAO.reInsertCoupon(coupNum, id);
		}
		
		System.out.println("정상!");
	}

}
