package com.yourplace.host.reserv.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.reserv.service.HostReservService;
import com.yourplace.host.reserv.vo.HostReservVO;

@Controller
public class HostReservController {
	@Inject
	HostReservService service;
	
	
	@RequestMapping(value="/placeReserveListForHost.hdo")
	public ModelAndView getHostReservList() throws Exception{
		List<HostReservVO> list = service.getAllReserve();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("placeReserveListForHost");
		return mav;
		
	}
	
	@RequestMapping(value="/LastPlaceReserveListForHost.hdo")
	public ModelAndView lastReserveList() throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HostReservVO> list = service.lastAllReserve();
		mav.addObject("list", list);
		mav.setViewName("LastReserveListForHost");
		return mav;
	}

}




	
	
	
	
