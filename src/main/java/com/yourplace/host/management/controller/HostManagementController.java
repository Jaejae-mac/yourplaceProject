package com.yourplace.host.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostManagementController {
	
	@RequestMapping(value="/managementHostPlace.hdo")
	public ModelAndView allPlace() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("managementHostPlace");
		return mav;
	}
	
	
	
	@RequestMapping(value="/insertPlaceforHost.hdo")
	public ModelAndView insertPlaceView() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertPlaceforHost");
		return mav;
	}

}
