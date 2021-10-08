package com.yourplace.host.profileUpdate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateImgVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateVO;

@Repository
public class HostProfileDAOImpl implements HostProfileDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public void updateProfileImg(HostInfoUpdateImgVO vo) throws Exception {
		session.update("HostDAO.updateHostInfoImg", vo);
	}

	@Override
	public void updateProfile(HostInfoUpdateVO vo) throws Exception {
		session.update("HostDAO.updateHostInfo", vo);
		
	}

	@Override
	public List<HostVO> getHostInfo(HostVO vo) throws Exception {
		return session.selectList("HostDAO.getHostInfo", vo);
	}

}
