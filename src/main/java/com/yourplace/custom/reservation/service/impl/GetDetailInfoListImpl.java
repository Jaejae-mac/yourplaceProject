package com.yourplace.custom.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.GetDetailInfoList;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;

@Service("getDetailInfoList")
public class GetDetailInfoListImpl implements GetDetailInfoList {
	@Autowired
	private RsvDAO rsvDAO;
	@Override
	public List<DetailPlaceVO> getDetailInfo(DetailPlaceVO vo) {
		
		return rsvDAO.getDetailInfoList(vo);
	}

}
