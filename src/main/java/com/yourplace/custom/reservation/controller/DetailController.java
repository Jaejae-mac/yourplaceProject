package com.yourplace.custom.reservation.controller;

import java.text.DecimalFormat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.reservation.service.GetDetailInfoList;
import com.yourplace.custom.reservation.service.GetImgInfoService;
import com.yourplace.custom.reservation.service.GetMyCouponListService;
import com.yourplace.custom.reservation.service.GetPlaceService;
import com.yourplace.custom.reservation.vo.CouponVO;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;
import com.yourplace.custom.reservation.vo.RsvVO;

@Controller
public class DetailController {
	@Autowired
	private GetPlaceService getPlaceService;
	@Autowired
	private GetDetailInfoList getDetailInfoList;
	@Autowired
	private GetImgInfoService getImgInfoService;
	@Autowired
	private GetMyCouponListService getMyCouponListService;
	
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
	
	@PostMapping("/reserveForm.do") 
	public String reserveForm(RsvVO vo, Model model, HttpServletRequest request, @RequestParam("placeNum") int placeNum) {
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		//세션이 존재하지 않으면 예약을 처리하지 못하도록 처리해야함.
		HttpSession session = request.getSession();
		if(session.getAttribute("userVO") != null) {
			DetailPlaceVO dvo = new DetailPlaceVO();
			dvo.setPlaceNum(placeNum);
			System.out.println("[ POST ] : DetailController - reserveForm");
			String userCoupId = ((UserVO)session.getAttribute("userVO")).getUserId();
			List<CouponVO> myCouponList = getMyCouponListService.getMyCouponList(userCoupId);
			
			System.out.println(vo.toString());
			System.out.println(placeNum);
			int hours = vo.getRsvEndT() - vo.getRsvStartT();
			int totalPrice = Integer.parseInt(vo.getPlacePrice()) * hours * vo.getHeadCount();
			String price = dc.format(Double.parseDouble(String.valueOf(totalPrice)));
			vo.setPlacePrice(String.valueOf(price));
			vo.setPlaceNum(placeNum);
			model.addAttribute("myCouponList", myCouponList);
			model.addAttribute("reserving", "1");
			model.addAttribute("placeInfo", vo);
			model.addAttribute("detailNum", vo.getDetailNum());
			model.addAttribute("placeMaincate", vo.getPlaceMaincate());
			model.addAttribute("placeCate", vo.getPlaceCate());
			
			return "reservation/reserveForm";
		}
		//만약 세션이 존재하지 않는다면 접근거부로 판단 로그인 창으로 보내주어야한다.
		model.addAttribute("accessDenied","accessDenied");
		return "redirect:loginForm.do";
	}
}
