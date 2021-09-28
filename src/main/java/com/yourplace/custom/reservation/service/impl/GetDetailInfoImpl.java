package com.yourplace.custom.reservation.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.GetDetailInfo;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;

@Service("getDetailInfo")
public class GetDetailInfoImpl implements GetDetailInfo {
	
	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public DetailPlaceVO getDetailInfo(DetailPlaceVO vo) {
		return rsvDAO.getDetailInfo(vo);
	}

}
