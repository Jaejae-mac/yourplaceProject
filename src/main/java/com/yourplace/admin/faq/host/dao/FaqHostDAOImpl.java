package com.yourplace.admin.faq.host.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.faq.host.vo.FaqHostVO;

@Repository("faqHostDAO")
public class FaqHostDAOImpl implements FaqHostDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<FaqHostVO> getFaqList() {
		
		System.out.println("---> MyBatis 로 getFaqList 기능 처리");
		return sqlSessionTemplate.selectList("FaqHostDAO.getFaqList");
		
	}

	@Override
	public void deleteInfoHost(String deleteInfoTitle) {
		System.out.println("---> MyBatis 로 getFaqList 기능 처리");
		sqlSessionTemplate.delete("FaqHostDAO.deleteInfoHost", deleteInfoTitle);
	}

	@Override
	public void insertInfo(FaqHostVO vo) {
		System.out.println("---> MyBatis 로 insertInfo 기능 처리");
		sqlSessionTemplate.insert("FaqHostDAO.insertInfoHost", vo);
		
	}

}
