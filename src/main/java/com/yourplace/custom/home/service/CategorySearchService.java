package com.yourplace.custom.home.service;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;

public interface CategorySearchService {
	List<PlaceCardVO> getPlacePeople(int num, String maincate, String subcate, String sort);
	List<PlaceCardVO> getPlacePrice(int min, int max, String maincate, String subcate, String sort);
	List<PlaceCardVO> getPlaceAddr(String addr, String maincate, String subcate, String sort);
}
