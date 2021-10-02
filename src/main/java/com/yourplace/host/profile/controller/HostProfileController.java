package com.yourplace.host.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.impl.bootstrap.HttpServer;
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
		String sid = (String) session.getAttribute("userId");
		String snick = (String) session.getAttribute("userNick");
		String sinfo=(String)session.getAttribute("userInfo");
		String smail = (String)session.getAttribute("userMail");
		String stel = (String)session.getAttribute("userTel");
		
		mav.addObject("userId", sid);
		mav.addObject("userNick", snick);
		mav.addObject("userInfo", sinfo);
		mav.addObject("userMail", smail);
		mav.addObject("userTel", stel);
		
		mav.setViewName("updateProfileforHost");
		return mav;
	}
	
	@RequestMapping(value="/myProfile.hdo")
	public ModelAndView viewProfile(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myProfile");
		return mav;
	}
	


}
