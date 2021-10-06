package com.yourplace.admin.payment.service;

public interface RefundProcessService {

	void refundDone(String orderNum);
	
	void refundCoupon(String orderNum);
	
}
