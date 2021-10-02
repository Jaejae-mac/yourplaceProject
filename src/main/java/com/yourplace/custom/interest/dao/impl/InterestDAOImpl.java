package com.yourplace.custom.interest.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.interest.dao.InterestDAO;
import com.yourplace.custom.interest.vo.InterestVO;

@Repository("InterestDAO")
public class InterestDAOImpl implements InterestDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<InterestVO> interestView(InterestVO vo) {
		System.out.println("---> MyBatis로 interestView() 기능 처리");
		List<InterestVO> list = sqlSessionTemplate.selectList("InterestDAO.interestView", vo);
		System.out.println("[InterestDAO]" + list.toString());
		return list;
	}

	// 관심장소 등록하기 처리 메서드
	@Override
	public void insertInter(InterestVO vo) {
		System.out.println("---> MyBatis로 insertInter() 기능 처리");
		sqlSessionTemplate.insert("InterestDAO.insertInter", vo);
	}
	
	@Override
	public void deleteInter(int placeNum) {
		sqlSessionTemplate.delete("InterestDAO.deleteInter", placeNum);
	}
}
