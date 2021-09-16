package com.yourplace.custom.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.custom.mypage.service.MyPageUpdateService;

@Service("MyPageUpdateService")
public class MyPageUpdateServiceImpl implements MyPageUpdateService {
	@Autowired
	private MyPageDAO dao;
	
	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
	}
}
