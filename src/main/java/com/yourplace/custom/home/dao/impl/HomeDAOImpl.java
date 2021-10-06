package com.yourplace.custom.home.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.home.dao.HomeDAO;
import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.interest.vo.InterestVO;

@Repository("homeDAO")
public class HomeDAOImpl implements HomeDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//신규등록 장소 목록을 가져오는 메서드.
	@Override
	public List<PlaceCardVO> getLatestPlaceList() {
		
		return sqlSessionTemplate.selectList("HomeDAO.getLatestPlaceList");
	}

	@Override
	public List<PlaceCardVO> getCatePlaceList(String maincate, String subcate) {
		PlaceCardVO vo = new PlaceCardVO();
		vo.setPlaceMaincate(maincate);
		vo.setPlaceCate(subcate);
		return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceList",vo);
	}

	@Override
	public List<PlaceCardVO> getCatePlaceListAll() {
		
		return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceListAll");
	}

}
