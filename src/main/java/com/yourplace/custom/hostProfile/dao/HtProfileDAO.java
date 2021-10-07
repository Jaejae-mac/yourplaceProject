package com.yourplace.custom.hostProfile.dao;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.host.login.vo.HostVO;

public interface HtProfileDAO {
	HostVO hostProfile(HostVO vo);
	List<PlaceCardVO> getHostPlaceList(HostVO vo);
}
