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
	public List<HostVO> getHostInfo() throws Exception {
		return session.selectList("HostDAO.getHostInfo");
	}

	@Override
	public HostVO getHost(HostVO vo) {
		return (HostVO)session.selectOne("HostDAO.getHost", vo);
	}

}
