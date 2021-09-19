package com.yourplace.host.regist.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.host.regist.dao.RegistPlaceDAO;
import com.yourplace.host.regist.service.CurrentSeqService;

@Service("currentSeqService")
public class CurrentSeqServiceImpl implements CurrentSeqService {

	@Autowired
	private RegistPlaceDAO registPlaceDAO;
	
	@Override
	public int getCurSeq() {
		
		return registPlaceDAO.getCurSeq();
	}

}
