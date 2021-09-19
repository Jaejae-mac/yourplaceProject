package com.yourplace.host.regist.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.host.regist.dao.RegistPlaceDAO;
import com.yourplace.host.regist.service.PlaceDetailService;
import com.yourplace.host.regist.vo.PlaceDetailVO;
@Service("placeDetailService")
public class PlaceDetailServiceImpl implements PlaceDetailService {

	@Autowired
	private RegistPlaceDAO registPlaceDAO;
	@Override
	public void setPlaceDetail(PlaceDetailVO vo) {
		registPlaceDAO.setPlaceDetail(vo);
	}

}
