package com.yourplace.custom.mypage.service;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;

public interface MyPageUpdateService {
	void updateUser(UserVO vo);
	void updatePw(UserVO vo);
}
