package com.yourplace.custom.home.service;

import java.util.List;

import com.yourplace.custom.home.vo.PlaceCardVO;

public interface CategoryKewordService {
	List<PlaceCardVO> getKeywordList(PlaceCardVO vo);
	List<PlaceCardVO> getnewCategoryList();
}
