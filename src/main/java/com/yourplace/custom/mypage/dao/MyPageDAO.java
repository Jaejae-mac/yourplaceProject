package com.yourplace.custom.mypage.dao;

import com.yourplace.custom.login.vo.UserVO;

public interface MyPageDAO {
	
	void updateUser(UserVO vo);
	void updatePw(UserVO vo);
	void deleteUser(UserVO vo);
	void deleteInterest(UserVO vo);
}
