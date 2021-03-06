package com.yourplace.host.ask.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.ask.dao.AskDAO;
import com.yourplace.host.ask.vo.AskVO;

@Service
public class AskServiceImpl implements AskService {
	
	@Inject
	private AskDAO dao;

	@Override
	public List<AskVO> getMyAskList(AskVO vo) throws Exception {
		return dao.getMyAskList(vo);
	}

	@Override
	public void insertAsk(AskVO vo) throws Exception {
		dao.insertAsk(vo);
	}

	@Override
	public List<AskVO> getMyPlace(AskVO vo) throws Exception {
		return dao.getMyPlace(vo);
	}



}
