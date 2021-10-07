package com.yourplace.custom.home.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.home.dao.HomeDAO;
import com.yourplace.custom.home.service.CategorySearchService;
import com.yourplace.custom.home.vo.PlaceCardVO;
@Service("CategorySearchService")
public class CategorySearchServiceImpl implements CategorySearchService {
	@Autowired
	private HomeDAO homeDAO;
	@Override
	public List<PlaceCardVO> getPlacePeople(int num, String maincate, String subcate, String sort) {
		System.out.println("CategoryServiceImpl called");
		List<PlaceCardVO> list = homeDAO.getPlacePeopleList(num, maincate, subcate, sort);
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		for(PlaceCardVO vo : list) {
			if(vo.getPlaceName() == null) {
				vo.setPlaceName("Empty");
			}
			if(vo.getPlaceArea() == null) {
				vo.setPlaceArea("Empty");
			}
			if(vo.getPlaceCapa() == null) {
				vo.setPlaceCapa("Empty");
			}
			if(vo.getPlaceCapaCar() == null) {
				vo.setPlaceCapa("Empty");
			}
			if(vo.getPlaceCate() == null) {
				vo.setPlaceCate("Empty");
			}
			if(vo.getPlacePrice() == null) {
				vo.setPlacePrice("Empty");
			}else {
				String price = dc.format(Double.parseDouble(vo.getPlacePrice()));
				vo.setPlacePrice(price);
			}
			if(vo.getPlaceThumb() == null) {
				vo.setPlaceThumb("empty");
			}else {
				String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/"+ vo.getPlaceThumb();
				vo.setPlaceThumb(ThumbPath);
			}
			if(vo.getAvgRate() == null) {
				vo.setAvgRate("Empty");
			}
			if(vo.getReviewCnt() == null) {
				vo.setReviewCnt("Empty");
			}
		}
		return list;
	}
	@Override
	public List<PlaceCardVO> getPlacePrice(int min, int max, String maincate, String subcate, String sort) {
		System.out.println("CategoryServiceImpl called");
		List<PlaceCardVO> list = homeDAO.getPlacePriceList(min, max, maincate, subcate, sort);
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		for(PlaceCardVO vo : list) {
			if(vo.getPlaceName() == null) {
				vo.setPlaceName("Empty");
			}
			if(vo.getPlaceArea() == null) {
				vo.setPlaceArea("Empty");
			}
			if(vo.getPlaceCapa() == null) {
				vo.setPlaceCapa("Empty");
			}
			if(vo.getPlaceCapaCar() == null) {
				vo.setPlaceCapa("Empty");
			}
			if(vo.getPlaceCate() == null) {
				vo.setPlaceCate("Empty");
			}
			if(vo.getPlacePrice() == null) {
				vo.setPlacePrice("Empty");
			}else {
				String price = dc.format(Double.parseDouble(vo.getPlacePrice()));
				vo.setPlacePrice(price);
			}
			if(vo.getPlaceThumb() == null) {
				vo.setPlaceThumb("empty");
			}else {
				String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/"+ vo.getPlaceThumb();
				vo.setPlaceThumb(ThumbPath);
			}
			if(vo.getAvgRate() == null) {
				vo.setAvgRate("Empty");
			}
			if(vo.getReviewCnt() == null) {
				vo.setReviewCnt("Empty");
			}
		}
		return list;
	}
	@Override
	public List<PlaceCardVO> getPlaceAddr(String addr, String maincate, String subcate, String sort) {
		System.out.println("CategoryServiceImpl called");
		List<PlaceCardVO> list = homeDAO.getPlaceAddrList(addr, maincate, subcate, sort);
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		for(PlaceCardVO vo : list) {
			if(vo.getPlaceName() == null) {
				vo.setPlaceName("Empty");
			}
			if(vo.getPlaceArea() == null) {
				vo.setPlaceArea("Empty");
			}
			if(vo.getPlaceCapa() == null) {
				vo.setPlaceCapa("Empty");
			}
			if(vo.getPlaceCapaCar() == null) {
				vo.setPlaceCapa("Empty");
			}
			if(vo.getPlaceCate() == null) {
				vo.setPlaceCate("Empty");
			}
			if(vo.getPlacePrice() == null) {
				vo.setPlacePrice("Empty");
			}else {
				String price = dc.format(Double.parseDouble(vo.getPlacePrice()));
				vo.setPlacePrice(price);
			}
			if(vo.getPlaceThumb() == null) {
				vo.setPlaceThumb("empty");
			}else {
				String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/"+ vo.getPlaceThumb();
				vo.setPlaceThumb(ThumbPath);
			}
			if(vo.getAvgRate() == null) {
				vo.setAvgRate("Empty");
			}
			if(vo.getReviewCnt() == null) {
				vo.setReviewCnt("Empty");
			}
		}
		return list;
	}
}
