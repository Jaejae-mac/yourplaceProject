package com.yourplace.custom.question.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.question.dao.QuestionDAO;
import com.yourplace.custom.question.vo.QuestionVO;

@Repository("QeustionDAO")
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void guestQues(QuestionVO vo) {
		sqlSessionTemplate.insert("GuestQuesDAO.insertQues", vo);

	}

}
