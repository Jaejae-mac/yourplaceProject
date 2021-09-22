package com.yourplace.host.login.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.login.vo.HostVO;

@Repository
public class HostLoginDAOImpl implements HostLoginDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public List<HostVO> getHostInfo(HostVO vo) throws Exception {
		return session.selectList("HostDAO.getHostInfo", vo);
	}

	@Override
	public HostVO getHost(HostVO vo) {
		return (HostVO)session.selectOne("HostDAO.getHost", vo);
	}

	@Override
	public void updateProfile(HostVO vo) throws Exception {
		session.update("HostDAO.updateHostInfo", vo);
		
	}

}
