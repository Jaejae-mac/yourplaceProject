package com.yourplace.custom.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.custom.reservation.service.GetDetailInfoList;
import com.yourplace.custom.reservation.service.GetImgInfoService;
import com.yourplace.custom.reservation.service.GetPlaceService;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;

@Controller
public class DetailController {
	@Autowired
	private GetPlaceService getPlaceService;
	@Autowired
	private GetDetailInfoList getDetailInfoList;
	@Autowired
	private GetImgInfoService getImgInfoService;
	
	@GetMapping("/detailPlaceForm.do")
	public String detailPlaceForm(@RequestParam("placeNum") String placeNum, Model model) {
		PlaceInfoVO vo = new PlaceInfoVO();
		DetailPlaceVO dvo = new DetailPlaceVO();
		dvo.setPlaceNum(Integer.parseInt(placeNum));
		vo.setPlaceNum(Integer.parseInt(placeNum));
		PlaceInfoVO placeInfo = getPlaceService.getPlaceInfo(vo);
		List<PlaceImgVO> imgList = getImgInfoService.getImgInfo(Integer.parseInt(placeNum));
		List<DetailPlaceVO> detailInfoList = getDetailInfoList.getDetailInfo(dvo);
		
		String[] htArr = placeInfo.getPlaceTag().split("#");
		System.out.println(htArr.toString());
		List<String> hashTags = new ArrayList<String>();
		for(int i = 0; i < htArr.length; i++) {
			if(htArr[i].length() > 0) {
				hashTags.add(htArr[i]);
			}
			
		}
		placeInfo.setHashTags(hashTags);
		placeInfo.setPlaceRule(placeInfo.getPlaceRule().replace("\r\n", "<br>"));
		placeInfo.setPlaceSurinfo(placeInfo.getPlaceSurinfo().replace("\r\n", "<br>"));
		placeInfo.setPlaceIntro(placeInfo.getPlaceIntro().replace("\r\n", "<br>"));
		placeInfo.setRateHeader(placeInfo.getAvgRate().substring(0,1));
		placeInfo.setImgCnt(imgList.size()-1);
		
		System.out.println(placeInfo.toString());
		System.out.println(imgList);
		System.out.println(detailInfoList);
		model.addAttribute("placeInfo", placeInfo);
		model.addAttribute("imgList", imgList);
		model.addAttribute("detailInfoList", detailInfoList);
		return "detailPlaceForm";
	}
}
