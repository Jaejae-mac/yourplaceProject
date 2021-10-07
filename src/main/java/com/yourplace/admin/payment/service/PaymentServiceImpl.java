package com.yourplace.admin.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.payment.dao.PaymentDAO;
import com.yourplace.admin.payment.vo.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;

	@Override
	public List<PaymentVO> getPayment() {
		List<PaymentVO> list = paymentDAO.getPayment();
		return list;
	}

	@Override
	public List<PaymentVO> getRefund() {
		List<PaymentVO> list = paymentDAO.getRefund();
		return list;
	}
	
	
	
}
