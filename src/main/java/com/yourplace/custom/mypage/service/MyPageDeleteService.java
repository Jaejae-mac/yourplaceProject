package com.yourplace.custom.mypage.service;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.host.regist.vo.PlaceVO;

public interface MyPageDeleteService {
	void deleteUser(UserVO vo);
	void deleteInterest(UserVO vo);
	void deletePlace(PlaceVO vo);
	void deletePlaceImgDetail(int placenum);
}	
