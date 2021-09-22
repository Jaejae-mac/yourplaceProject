package com.yourplace.host.login.dao;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;

public interface HostLoginDAO {
	List<HostVO> getHostInfo(HostVO vo) throws Exception;
	HostVO getHost(HostVO vo);
	void updateProfile(HostVO vo) throws Exception; 
}
