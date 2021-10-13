package com.yourplace.custom.mypage.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.host.regist.vo.PlaceVO;

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
	public void updatePw(UserVO vo) {
		System.out.println("--> MyBatis로 updateUser() 기능 처리");
		sqlSessionTemplate.update("UserDAO.updatePassword", vo);
	}
	@Override
	public void deleteUser(UserVO vo) {
		System.out.println("--> MyBatis로 deleteUser() 기능 처리");
		sqlSessionTemplate.delete("UserDAO.deleteUser", vo);
	}
	@Override
	public void deleteInterest(UserVO vo) {
		System.out.println("--> MyBatis로 deleteInterest() 기능 처리");
		sqlSessionTemplate.delete("InterestDAO.deleteInterestUser", vo);
	}
	@Override
	public void deletePlace(PlaceVO vo) {
		System.out.println("--> MyBatis로 deletePlace() 기능 처리");
		sqlSessionTemplate.delete("RegistPlaceDAO.deletePlace", vo);
	}
	@Override
	public void deletePlaceImgDetail(PlaceVO vo) {
		System.out.println("--> MyBatis로 deletePlace() 기능 처리");
		sqlSessionTemplate.delete("RegistPlaceDAO.deletePlaceImg", vo);
		sqlSessionTemplate.delete("RegistPlaceDAO.deletePlaceDetail", vo);
	}
	@Override
	public List<PlaceVO> getPlace(PlaceVO vo){
		return sqlSessionTemplate.selectList("RegistPlaceDAO.getPlaceNum", vo);
	}
}
