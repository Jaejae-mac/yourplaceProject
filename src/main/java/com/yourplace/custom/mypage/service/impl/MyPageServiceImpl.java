package com.yourplace.custom.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.dao.LoginDAO;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.service.MyPageService;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private LoginDAO dao;
	@Override
	public UserVO getUser(UserVO vo) {
		UserVO uvo = dao.getUser(vo);
		if(uvo.getUserProfileImg() == null) {
			String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/profile/default/defaultprofile.png";
			uvo.setUserProfileImg(ThumbPath);
		}else {
			String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/"+ uvo.getUserProfileImg();
			uvo.setUserProfileImg(ThumbPath);
		}
		return uvo;
	}
}
