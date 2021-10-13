package com.yourplace.custom.mypage.dao;

import java.util.List;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.regist.vo.PlaceVO;

public interface MyPageDAO {
	
	void updateUser(UserVO vo);
	void updatePw(UserVO vo);
	void deleteUser(UserVO vo);
	void deleteInterest(UserVO vo);
	void deletePlace(PlaceVO vo);
	List<PlaceVO> getPlace(PlaceVO vo);
}
