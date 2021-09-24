package com.yourplace.admin.question.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.question.vo.QuestionVO;

@Repository("queDAO")
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<QuestionVO> getQue() {
		System.out.println("---> MyBatis 로 getQue() 기능 처리 ");
		return sqlSessionTemplate.selectList("QuestionDAO.getQue");
	}

}
