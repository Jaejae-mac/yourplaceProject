package com.yourplace.custom.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.CouponDAO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.custom.mypage.service.MyPageDeleteService;
@Service("MyPageDeleteService")
public class MyPageDeleteServiceImpl implements MyPageDeleteService {
	@Autowired
	private MyPageDAO dao;
	@Override
	public void deleteUser(UserVO vo) {
		dao.deleteUser(vo);
	}
}
