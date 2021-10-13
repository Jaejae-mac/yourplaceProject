package com.yourplace.host.profileUpdate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.dao.HostProfileDAO;

@Service
public class HostProfileServiceImpl implements HostProfileService{

	@Inject
	private HostProfileDAO dao;
	
	@Override
	public List<HostVO> getHostInfo(HostVO vo) throws Exception {
		return dao.getHostInfo(vo);
	}
	
}
