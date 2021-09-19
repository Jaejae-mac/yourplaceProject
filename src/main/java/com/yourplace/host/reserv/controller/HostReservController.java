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
<<<<<<< HEAD
	public ModelAndView mainView(HttpServletRequest request) throws Exception {
		List<HostReservVO> list = service.getAllReserve();
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("userId");
//		System.out.println(id);
		mav.addObject("list", list);
		mav.addObject("userId", id);
=======
	public ModelAndView mainView() throws Exception {
		List<HostReservVO> list = service.getAllReserve();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
>>>>>>> 048c1b2f8ce36b365d8039112f0f3e58c6ee13f1
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
	
	
	
}




	
	
	
	
