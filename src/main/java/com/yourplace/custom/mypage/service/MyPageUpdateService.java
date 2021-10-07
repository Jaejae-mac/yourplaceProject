package com.yourplace.custom.mypage.service;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yourplace.custom.login.vo.UserVO;

public interface MyPageUpdateService {
	void updateUser(UserVO vo);
	void updatePw(UserVO vo);
}
