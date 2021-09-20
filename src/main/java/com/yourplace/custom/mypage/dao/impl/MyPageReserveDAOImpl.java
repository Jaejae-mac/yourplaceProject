package com.yourplace.custom.mypage.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.mypage.dao.MyPageReserveDAO;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;
@Repository("MyPageReserveDAO")
public class MyPageReserveDAOImpl implements MyPageReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getMyReserveList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getMyReserveList",vo);
		System.out.println(tvo.toString());
		return tvo;
	}

}
