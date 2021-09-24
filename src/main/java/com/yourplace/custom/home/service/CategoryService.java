package com.yourplace.custom.home.service;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;

public interface CategoryService {
	List<PlaceCardVO> getCatePlace(String maincate, String subcate);
}
