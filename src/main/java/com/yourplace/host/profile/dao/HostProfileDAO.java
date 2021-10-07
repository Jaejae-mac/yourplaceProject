package com.yourplace.host.profile.dao;

import com.yourplace.host.profile.vo.HostInfoUpdateVO;

public interface HostProfileDAO {
	void updateProfile(HostInfoUpdateVO vo) throws Exception;
}
