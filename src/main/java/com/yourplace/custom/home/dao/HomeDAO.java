package com.yourplace.custom.home.dao;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;

public interface HomeDAO {
	List<PlaceCardVO> getLatestPlaceList();
}
