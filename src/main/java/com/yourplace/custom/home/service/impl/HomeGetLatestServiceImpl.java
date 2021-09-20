package com.yourplace.custom.home.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.home.dao.HomeDAO;
import com.yourplace.custom.home.service.HomeGetLatestService;
import com.yourplace.custom.home.vo.PlaceCardVO;

@Service("homeGetLatestService")
public class HomeGetLatestServiceImpl implements HomeGetLatestService {

	@Autowired
	private HomeDAO homeDAO;
	
	@Override
	public List<PlaceCardVO> getLatestPlaceList() {
		List<PlaceCardVO> latestPlaces = homeDAO.getLatestPlaceList();
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		for(PlaceCardVO vo : latestPlaces) {
			String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/"+ vo.getPlaceThumb();
			vo.setPlaceThumb(ThumbPath);
			String price = dc.format(Double.parseDouble(vo.getPlacePrice()));
			vo.setPlacePrice(price);
		}
		 
		return latestPlaces;
	}

}
