package com.yourplace.host.profile.service;

import org.springframework.stereotype.Service;

import com.google.inject.Inject;
import com.yourplace.host.profile.dao.HostProfileDAO;
import com.yourplace.host.profile.vo.HostInfoUpdateVO;

@Service
public class HostProfileServiceImpl implements HostProfileService{

	@Inject
	private HostProfileDAO dao;
	@Override
	public void updateProfile(HostInfoUpdateVO vo) throws Exception {
		dao.updateProfile(vo);
		
	}

}
