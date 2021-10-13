package com.yourplace.custom.mypage.service;

import java.util.List;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.regist.vo.PlaceVO;

public interface MyPageService {
	UserVO getUser(UserVO vo);
	List<PlaceVO> getPlace(PlaceVO vo);
}
