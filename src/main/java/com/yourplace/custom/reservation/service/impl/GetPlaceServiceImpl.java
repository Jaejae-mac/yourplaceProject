package com.yourplace.custom.reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.GetPlaceService;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;
@Service("getPlaceService")
public class GetPlaceServiceImpl implements GetPlaceService {
	@Autowired
	private RsvDAO rsvDAO;
	@Override
	public PlaceInfoVO getPlaceInfo(PlaceInfoVO vo) {
		
		return rsvDAO.getPlaceInfo(vo);
	}

}
