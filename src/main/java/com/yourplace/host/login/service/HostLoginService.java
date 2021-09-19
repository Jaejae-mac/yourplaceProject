package com.yourplace.host.login.service;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;

public interface HostLoginService {
	List<HostVO> getHostInfo() throws Exception;
	int getHostLogin(HostVO vo);
}
