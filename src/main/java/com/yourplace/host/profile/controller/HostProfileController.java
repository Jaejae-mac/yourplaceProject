package com.yourplace.host.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.login.vo.HostVO;

@Controller
public class HostProfileController {
	
	@RequestMapping(value="/updateProfileforHost.hdo")
	public ModelAndView hostProfile(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String hostnick = (String)session.getAttribute("userNickName");
		String hostIntro = (String)session.getAttribute("userIntro");
		System.out.println(hostnick);
		System.out.println(hostIntro);
		mav.setViewName("updateProfileforHost");
		mav.addObject("hostNick", hostnick); //닉네임
		mav.addObject("hostIntro", hostIntro); //자기소개
		
		return mav;
	}
	

}
