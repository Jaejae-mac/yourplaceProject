package com.yourplace.host.profileUpdate.dao;

import java.util.List;

import com.yourplace.host.login.vo.HostVO;

public interface HostProfileDAO {
	List<HostVO> getHostInfo(HostVO vo) throws Exception;
}
