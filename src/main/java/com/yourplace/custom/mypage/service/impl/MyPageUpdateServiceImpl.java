package com.yourplace.custom.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.custom.mypage.service.MyPageUpdateService;

@Service("MyPageUpdateService")
public class MyPageUpdateServiceImpl implements MyPageUpdateService {
	@Autowired
	private MyPageDAO dao;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Override
	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
	}
	@Override
	public void updatePw(UserVO vo) {
		String password = vo.getUserPw();
		String encodePw = passEncoder.encode(password);
		vo.setUserPw(encodePw);
		dao.updatePw(vo);
	}
}
