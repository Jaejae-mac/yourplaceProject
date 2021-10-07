package com.yourplace.host.profile.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.google.inject.Inject;
import com.yourplace.custom.question.vo.HostInfoVO;
import com.yourplace.host.profile.vo.HostInfoUpdateVO;

@Repository
public class HostProfileDAOImpl implements HostProfileDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public void updateProfile(HostInfoUpdateVO vo) throws Exception {
		session.update("HostDAO.updateHostInfo", vo);
		
	}

}
