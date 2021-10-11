package com.yourplace.host.profileUpdate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.dao.HostProfileDAO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateImgVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateVO;

@Service
public class HostProfileServiceImpl implements HostProfileService{

	@Inject
	private HostProfileDAO dao;
	
//	@Override
//	public void updateProfileImg(HostInfoUpdateImgVO vo) throws Exception {
//		dao.updateProfileImg(vo);
//	}

//	@Override
//	public void updateProfile(HostInfoUpdateVO vo) throws Exception {
//		dao.updateProfile(vo);
//	}

	@Override
	public List<HostVO> getHostInfo(HostVO vo) throws Exception {
		return dao.getHostInfo(vo);
	}
	
}
