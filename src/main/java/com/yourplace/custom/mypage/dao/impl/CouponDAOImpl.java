package com.yourplace.custom.mypage.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.mypage.dao.CouponDAO;
import com.yourplace.custom.mypage.vo.MyPageCouponVO;

@Repository("CouponDAO")
public class CouponDAOImpl implements CouponDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MyPageCouponVO> getCouponList(MyPageCouponVO vo) {
		System.out.println("--> MyBatis로 getBoardList() 기능 처리");
		List<MyPageCouponVO> tvo =sqlSessionTemplate.selectList("CouponDAO.getCouponList",vo);
		System.out.println(tvo.toString());
		return tvo;
	}

}
