package com.yourplace.custom.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageDAO;
import com.yourplace.custom.mypage.service.MyPageDeleteService;
@Service("MyPageDeleteService")
public class MyPageDeleteServiceImpl implements MyPageDeleteService {
	@Autowired
	private MyPageDAO mypagedao;
	@Override
	public void deleteUser(UserVO vo) {
		AwsS3 awsS3 = AwsS3.getInstance();
		String key = vo.getUserProfileImg();
		awsS3.delete(key);
		mypagedao.deleteUser(vo);
	}
	@Override
	public void deleteInterest(UserVO vo) {
		mypagedao.deleteInterest(vo);
	}
}
