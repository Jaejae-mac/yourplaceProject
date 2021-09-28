package com.yourplace.admin.faq.guest.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.faq.guest.vo.FaqGuestVO;

@Repository("faqGuestDAO")
public class FaqGuestDAOImpl implements FaqGuestDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<FaqGuestVO> getFaqList() {
		
		System.out.println("---> MyBatis 로 getFaqList 기능 처리");
		return sqlSessionTemplate.selectList("FaqGuestDAO.getFaqList");
		
	}

	@Override
	public void deleteInfoGuest(String deleteInfoTitle) {
		System.out.println("---> MyBatis 로 getFaqList 기능 처리");
		sqlSessionTemplate.delete("FaqGuestDAO.deleteInfoGuest", deleteInfoTitle);
	}

	@Override
	public void insertInfo(FaqGuestVO vo) {
		System.out.println("---> MyBatis 로 insertInfo 기능 처리");
		sqlSessionTemplate.insert("FaqGuestDAO.insertInfoGuest", vo);
		
	}

}
