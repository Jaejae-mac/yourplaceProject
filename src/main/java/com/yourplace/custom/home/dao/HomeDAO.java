package com.yourplace.custom.home.dao;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.interest.vo.InterestVO;

public interface HomeDAO {
	List<PlaceCardVO> getLatestPlaceList();
	List<PlaceCardVO> getCatePlaceList(String maincate, String subcate);
	List<PlaceCardVO> getCatePlaceListAll();
}
