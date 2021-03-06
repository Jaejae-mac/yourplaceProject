package com.yourplace.custom.home.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.home.dao.HomeDAO;
import com.yourplace.custom.home.service.CategoryKewordService;
import com.yourplace.custom.home.vo.PlaceCardVO;
@Service("CategoryKewordService")
public class CategoryKewordServiceImpl implements CategoryKewordService {
	@Autowired
	private HomeDAO homeDAO;
	@Override
	public List<PlaceCardVO> getKeywordList(PlaceCardVO pvo) {
		List<PlaceCardVO> list = homeDAO.getKeywordPlaceList(pvo);
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
	public List<PlaceCardVO> getnewCategoryList() {
		List<PlaceCardVO> list = homeDAO.getnewCategoryList();
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
	}@Override
	public List<PlaceCardVO> getpopCategoryList() {
		List<PlaceCardVO> list = homeDAO.getpopCategoryList();
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
