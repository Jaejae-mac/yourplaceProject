package com.yourplace.admin.payment.service;

import java.util.List;

import com.yourplace.admin.payment.vo.PaymentVO;

public interface PaymentService {
	
	List<PaymentVO> getPayment();
	
	List<PaymentVO> getRefund();

}
