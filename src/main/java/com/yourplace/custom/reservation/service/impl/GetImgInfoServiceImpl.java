package com.yourplace.custom.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.GetImgInfoService;
import com.yourplace.custom.reservation.vo.PlaceImgVO;

@Service("getImgInfoService")
public class GetImgInfoServiceImpl implements GetImgInfoService {

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public List<PlaceImgVO> getImgInfo(int placeNum) {
		PlaceImgVO vo = new PlaceImgVO();
		vo.setPlaceNum(placeNum);
		return rsvDAO.getImgList(vo);
	}

}
