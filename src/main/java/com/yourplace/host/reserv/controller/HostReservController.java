package com.yourplace.host.reserv.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.reserv.service.HostReservService;
import com.yourplace.host.reserv.vo.HostReservVO;

@Controller
public class HostReservController {
	@Inject
	HostReservService service;
	
	@RequestMapping(value= "/indexOurPlace.hdo")
	public ModelAndView mainView(HttpServletRequest request) throws Exception {
		List<HostReservVO> list = service.getAllReserve();
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("userId");
//		System.out.println(id);
		mav.addObject("list", list);
		mav.addObject("userId", id);
		mav.setViewName("indexOurPlace");

		return mav;
		
	}
	
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
		mav.setViewName("LastReserveListForHost");
		return mav;
	}
	
	
}




	
	
	
	
