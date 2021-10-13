package com.yourplace.custom.home.dao;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.interest.vo.InterestVO;

public interface HomeDAO {
	List<PlaceCardVO> getLatestPlaceList();
	List<PlaceCardVO> getPopularPlaceList();
	List<PlaceCardVO> getCatePlaceListAll();
	List<PlaceCardVO> getCatePlaceList(String maincate, String subcate, String sort);
	List<PlaceCardVO> getKeywordPlaceList(PlaceCardVO vo);
	List<PlaceCardVO> getnewCategoryList();
	List<PlaceCardVO> getpopCategoryList();
	List<PlaceCardVO> getPlacePeopleList(int num, String maincate, String subcate, String sort);
	List<PlaceCardVO> getPlacePriceList(int min, int max, String maincate, String subcate, String sort);
	List<PlaceCardVO> getPlaceAddrList(String addr, String maincate, String subcate, String sort);
	
}
