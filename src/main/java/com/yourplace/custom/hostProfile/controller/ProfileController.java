package com.yourplace.custom.hostProfile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.hostProfile.service.HtProfileService;
import com.yourplace.host.login.vo.HostVO;



@Controller
public class ProfileController {

	@Autowired
	private HtProfileService htProfileService;
	
	@RequestMapping("/hostProfile.do")
	public String hostProfile(@RequestParam String hostId, Model model){
		HostVO vo = new HostVO();	
		vo.setUserId(hostId);
		HostVO Host = htProfileService.hostProfile(vo);
		System.out.println(vo.toString());
		System.out.println("호스트 리스트: "+ Host);
		List<PlaceCardVO> hostPlaces = htProfileService.getHostPlaceList(vo);
		model.addAttribute("hostInfo", Host);
		model.addAttribute("hostPlaceInfo", hostPlaces);
		
		System.out.println(model);
		return "mypage/hostProfile";
	}
}
