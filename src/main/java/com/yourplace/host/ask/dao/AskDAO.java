package com.yourplace.host.ask.dao;

import java.util.List;

import com.yourplace.host.ask.vo.AskVO;

public interface AskDAO {
	List<AskVO> getMyAskList(AskVO vo) throws Exception;
	void insertAsk(AskVO vo) throws Exception;

	
}
