package com.yourplace.host.profileUpdate.service;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;

public interface HostProfileService {
	List<HostVO> getHostInfo(HostVO vo) throws Exception;
}
