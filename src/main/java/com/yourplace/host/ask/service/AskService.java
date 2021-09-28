package com.yourplace.host.ask.service;

import java.util.List;

import com.yourplace.host.ask.vo.AskVO;

public interface AskService {
	List<AskVO> getMyAskList(AskVO vo) throws Exception;
	void insertAsk(AskVO vo) throws Exception;
	List<AskVO> getMyPlace(AskVO vo) throws Exception;
}
