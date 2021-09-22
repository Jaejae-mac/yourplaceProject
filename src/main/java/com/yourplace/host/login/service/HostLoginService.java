package com.yourplace.host.login.service;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;

public interface HostLoginService {
	List<HostVO> getHostInfo(HostVO vo) throws Exception;
	int getHostLogin(HostVO vo);
	void updateProfile(HostVO vo) throws Exception; 
}
