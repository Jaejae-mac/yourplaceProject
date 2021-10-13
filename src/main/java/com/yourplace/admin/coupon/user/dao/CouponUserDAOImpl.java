package com.yourplace.admin.coupon.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.coupon.user.vo.CouponUserVO;

@Repository("couponUserDAO")
public class CouponUserDAOImpl implements CouponUserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void sendCoupon(CouponUserVO vo, String sendCoupName) {
		
		System.out.println("---> MyBatis 로 sendCoupon 기능 처리");
		sqlSessionTemplate.insert("CouponUserDAO.insertCouponUser", vo);
		sqlSessionTemplate.update("CouponUserDAO.updateCouponUser", sendCoupName);
		sqlSessionTemplate.update("CouponUserDAO.updateCouponList", vo);
		
	}

	
	//쿠폰번호 조회 -> 사용한 적이 없는 사람의 '수'를 count 조회
	@Override
	public List<CouponUserVO> checkCount(String couponNum) {
		System.out.println("---> MyBatis 로 checkCount 기능 처리");
		List<CouponUserVO> list = sqlSessionTemplate.selectList("CouponUserDAO.checkCount", couponNum);
		return list;
	}

	//쿠폰번호 조회 -> 쿠폰받은적이 없는 유저의 아이디를 조회
	@Override
	public List<CouponUserVO> checkId(String couponNum) {
		System.out.println("---> MyBatis 로 checkId 기능 처리");
		List<CouponUserVO> list = sqlSessionTemplate.selectList("CouponUserDAO.checkId", couponNum);
		return list;
	}

	@Override
	public void addCoupon(CouponUserVO vo) {
		System.out.println("---> MyBatis 로 addCoupon 기능 처리");
		sqlSessionTemplate.insert("CouponUserDAO.addCoupon", vo);
	}

	
	////////////////////////////////////////////////////////////////////
	//쿠폰 재발급 - payment package 에서 사용함. Y -> N 으로 변경
	@Override
	public void reInsertCoupon(String coupNum, String userId) {
		System.out.println("---> MyBatis 로 reInsertCoupon 기능 처리");
		
		CouponUserVO vo = new CouponUserVO();
		vo.setCoupNum(coupNum);
		vo.setUserCoupId(userId);
		
		System.out.println("들어온 coupNum: " + coupNum);
		System.out.println("들어온 userId" + userId);
		
		sqlSessionTemplate.update("CouponUserDAO.reInsertCoupon", vo);
	}


	@Override
	public int checkCountInt(String couponNum) {
		System.out.println("---> MyBatis 로 checkCountInt 기능 처리");
		int result = sqlSessionTemplate.selectOne("CouponUserDAO.checkCountInt", couponNum);
		return result;
	}


	@Override
	public List<CouponUserVO> idMinus(String couponNum) {
		System.out.println("---> MyBatis 로 idMinus 기능 처리");
		List<CouponUserVO> list = sqlSessionTemplate.selectList("CouponUserDAO.idMinus", couponNum);
		return list;
	}


	@Override
	public void deleteUser(String couponNum) {
		System.out.println("---> MyBatis 로 deleteUser 기능 처리");
		sqlSessionTemplate.delete("CouponUserDAO.deleteUser", couponNum);
	}


	
}
