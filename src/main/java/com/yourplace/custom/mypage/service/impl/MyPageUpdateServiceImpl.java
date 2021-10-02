package com.yourplace.custom.mypage.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yourplace.commons.awss3.AwsS3;
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
		int userNum = vo.getUserNum();
		AwsS3 awsS3 = AwsS3.getInstance();
		File file = new File(vo.getUserProfileImg());
		if(file == null) {
			String key ="";
			vo.setUserProfileImg(key);
			awsS3.upload(file, key);
		}else {
			String key = "place/custom/profile/"+userNum +"/"+userNum+".png";
			vo.setUserProfileImg(key);
			awsS3.upload(file, key);
		}
		
		

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
