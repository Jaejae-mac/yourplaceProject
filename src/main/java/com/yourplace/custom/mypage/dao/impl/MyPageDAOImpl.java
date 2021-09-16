package com.yourplace.custom.mypage.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;

@Repository("MyPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public void updateUser(UserVO vo) {
		System.out.println("--> MyBatis로 updateUser() 기능 처리");
		sqlSessionTemplate.update("UserDAO.updateMyPage", vo);
	}
	
	@Override
	public void deleteUser(UserVO vo) {
		System.out.println("--> MyBatis로 deleteUser() 기능 처리");
		sqlSessionTemplate.delete("UserDAO.deleteUser", vo);
	}
}
