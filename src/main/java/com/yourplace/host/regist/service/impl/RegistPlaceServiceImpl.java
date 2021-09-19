package com.yourplace.host.regist.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.host.regist.dao.RegistPlaceDAO;
import com.yourplace.host.regist.service.RegistPlaceService;
import com.yourplace.host.regist.vo.PlaceVO;
@Service("registPlaceService")
public class RegistPlaceServiceImpl implements RegistPlaceService {

	@Autowired
	private RegistPlaceDAO registPlaceDAO;
	
	@Override
	public void registPlace(PlaceVO vo) {
		registPlaceDAO.setPlace(vo);
	}

}
