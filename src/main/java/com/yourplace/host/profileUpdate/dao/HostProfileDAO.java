package com.yourplace.host.profileUpdate.dao;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateImgVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateVO;

public interface HostProfileDAO {
	void updateProfileImg(HostInfoUpdateImgVO vo) throws Exception;
	void updateProfile(HostInfoUpdateVO vo) throws Exception;
	List<HostVO> getHostInfo(HostVO vo) throws Exception;
}
