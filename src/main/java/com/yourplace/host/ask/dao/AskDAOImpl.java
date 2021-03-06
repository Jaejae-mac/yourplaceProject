package com.yourplace.host.ask.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.ask.vo.AskVO;

@Repository
public class AskDAOImpl implements AskDAO {

	@Inject
	private SqlSession session;

	@Override
	public List<AskVO> getMyAskList(AskVO vo) throws Exception {
		return session.selectList("HostAskMapper.getMyAsk", vo);
	}

	@Override
	public void insertAsk(AskVO vo) throws Exception {
		session.insert("HostAskMapper.insertAsk", vo);
	}

	@Override
	public List<AskVO> getMyPlace(AskVO vo) throws Exception {
		return session.selectList("HostAskMapper.getMyPlace", vo);
	}


}
