package com.yourplace.host.profile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostProfileController {
	
	@RequestMapping(value="/updateProfileforHost.hdo")
	public ModelAndView hostProfile() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateProfileforHost");
		return mav;
	}
	

}
