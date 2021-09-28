package com.yourplace.custom.interest.dao.impl;

import java.util.List;

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
		System.out.println("---> MyBatis로 intersetView() 기능 처리");
		List<InterestVO> list = sqlSessionTemplate.selectList("InterestDAO.interestView", vo);
		System.out.println("[InvoiceDAO]"+ list.toString());
		return list;
	}

}
