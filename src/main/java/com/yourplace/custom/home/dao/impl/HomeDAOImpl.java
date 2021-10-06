package com.yourplace.custom.home.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.home.dao.HomeDAO;
import com.yourplace.custom.home.vo.PlaceCardVO;

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
	public List<PlaceCardVO> getCatePlaceList(String maincate, String subcate, String sort) {
		PlaceCardVO vo = new PlaceCardVO();
		vo.setPlaceMaincate(maincate);
		vo.setPlaceCate(subcate);
		if(sort.equals("최신순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceListNew",vo);
		}else if(sort.equals("추천순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceListBest",vo);
		}else if(sort.equals("오래된순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceListOld",vo);
		}else if(sort.equals("리뷰")) {
			return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceListReview",vo);
		}else if(sort.equals("평점")) {
			return sqlSessionTemplate.selectList("HomeDAO.getCatePlaceListRank",vo);
		}else {
			return null;
		}
	}
	@Override
	public List<PlaceCardVO> getKeywordPlaceList(PlaceCardVO vo){
		return sqlSessionTemplate.selectList("HomeDAO.getKeywordPlaceList",vo);
	}
	@Override
	public List<PlaceCardVO> getPlacePeopleList(int num, String maincate, String subcate, String sort) {
		PlaceCardVO vo = new PlaceCardVO();
		vo.setPlacePeople(num);
		vo.setPlaceMaincate(maincate);
		vo.setPlaceCate(subcate);
		if(sort.equals("최신순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePeopleListNew",vo);
		}else if(sort.equals("추천순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePeopleListBest",vo);
		}else if(sort.equals("오래된순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePeopleListOld",vo);
		}else if(sort.equals("리뷰")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePeopleListReview",vo);
		}else if(sort.equals("평점")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePeopleListRank",vo);
		}else {
			return null;
		}
	}
	@Override
	public List<PlaceCardVO> getPlacePriceList(int min, int max, String maincate, String subcate, String sort) {
		PlaceCardVO vo = new PlaceCardVO();
		vo.setMinPrice(min);
		vo.setMaxPrice(max);
		vo.setPlaceMaincate(maincate);
		vo.setPlaceCate(subcate);
		if(sort.equals("최신순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePriceListNew",vo);
		}else if(sort.equals("추천순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePriceListBest",vo);
		}else if(sort.equals("오래된순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePriceListOld",vo);
		}else if(sort.equals("리뷰")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePriceListReview",vo);
		}else if(sort.equals("평점")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlacePricerListRank",vo);
		}else {
			return null;
		}
	}
	@Override
	public List<PlaceCardVO> getPlaceAddrList(String addr, String maincate, String subcate, String sort) {
		PlaceCardVO vo = new PlaceCardVO();
		vo.setKeyword(addr);
		vo.setPlaceMaincate(maincate);
		vo.setPlaceCate(subcate);
		if(sort.equals("최신순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlaceAddrListNew",vo);
		}else if(sort.equals("추천순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlaceAddrListBest",vo);
		}else if(sort.equals("오래된순")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlaceAddrListOld",vo);
		}else if(sort.equals("리뷰")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlaceAddrListReview",vo);
		}else if(sort.equals("평점")) {
			return sqlSessionTemplate.selectList("HomeDAO.getPlaceAddrListRank",vo);
		}else {
			return null;
		}
	}
}
