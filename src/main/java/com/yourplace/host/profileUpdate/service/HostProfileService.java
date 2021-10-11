package com.yourplace.host.profileUpdate.service;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateImgVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateVO;

public interface HostProfileService {
//	void updateProfile(HostInfoUpdateVO vo) throws Exception;
	List<HostVO> getHostInfo(HostVO vo) throws Exception;
}
