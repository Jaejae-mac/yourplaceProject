package com.yourplace.admin.payment.dao;

import java.util.List;

import com.yourplace.admin.payment.vo.PaymentVO;

public interface PaymentDAO {

	List<PaymentVO> getPayment();
	
}
