package com.yourplace.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.dao.LoginDAO;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.custom.mypage.service.MyPageService;
import com.yourplace.host.regist.vo.PlaceVO;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private LoginDAO dao;
	@Autowired
	private MyPageDAO mypagedao;
	@Override
	public UserVO getUser(UserVO vo) {
		UserVO uvo = dao.getUser(vo);
		if(uvo.getUserProfileImg() == null) {
			String ThumbPath ="profile/default/defaultprofile.png";
			uvo.setUserProfileImg(ThumbPath);
		}
		return uvo;
	}
	@Override
	public List<PlaceVO> getPlace(PlaceVO vo) {
		return mypagedao.getPlace(vo);
	}
}
