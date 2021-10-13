package com.yourplace.host.profileUpdate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.login.vo.HostVO;

@Repository
public class HostProfileDAOImpl implements HostProfileDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public List<HostVO> getHostInfo(HostVO vo) throws Exception {
		return session.selectList("HostDAO.getHostInfo", vo);
	}

}
