package com.yourplace.admin.payment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.payment.vo.PaymentVO;

@Repository("paymentDAO")
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<PaymentVO> getPayment() {
		System.out.println("---> MyBatis 로 getPayment() 기능 처리");
		return sqlSessionTemplate.selectList("PaymentDAO.getPayment");
	}

}
