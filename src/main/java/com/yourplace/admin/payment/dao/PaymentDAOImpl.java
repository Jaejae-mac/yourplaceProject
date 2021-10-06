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

	@Override
	public List<PaymentVO> getRefund() {
		System.out.println("---> MyBatis 로 getRefund() 기능 처리");
		return sqlSessionTemplate.selectList("PaymentDAO.getRefund");
	}

	@Override
	public void refundDone(String orderNum) {
		System.out.println("---> MyBatis 로 refundDone() 기능 처리");
		sqlSessionTemplate.update("PaymentDAO.refundDone", orderNum);
	}

	@Override
	public PaymentVO refundCoupon(String orderNum) {
		System.out.println("---> MyBatis 로 refundCoupon() 기능 처리");
		PaymentVO vo = sqlSessionTemplate.selectOne("PaymentDAO.refundCoupon", orderNum);
		System.out.println(vo.getOrderNum());
		System.out.println(vo.getUserId());
		return vo;
	}

}
