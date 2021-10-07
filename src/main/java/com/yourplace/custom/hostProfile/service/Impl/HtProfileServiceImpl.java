package com.yourplace.custom.hostProfile.service.Impl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.hostProfile.dao.HtProfileDAO;
import com.yourplace.custom.hostProfile.service.HtProfileService;
import com.yourplace.host.login.vo.HostVO;

@Service("HtProfileService")
public class HtProfileServiceImpl implements HtProfileService {

	@Autowired
	private HtProfileDAO htProfiledao;
	
	@Override
	public HostVO hostProfile(HostVO vo){
		HostVO hvo = htProfiledao.hostProfile(vo);
		if(hvo.getUserProfileImg() == null) {
			String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/profile/default/defaultprofile.png";
			hvo.setUserProfileImg(ThumbPath);
		}else {
			String ThumbPath ="https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/"+ hvo.getUserProfileImg();
			hvo.setUserProfileImg(ThumbPath);
		}
		return hvo;
	}
	
	@Override
	public List<PlaceCardVO> getHostPlaceList(HostVO hvo) {
		List<PlaceCardVO> hostPlaces = htProfiledao.getHostPlaceList(hvo);
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		for(PlaceCardVO vo : hostPlaces) {
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
		 
		return hostPlaces;
	}
	
}
