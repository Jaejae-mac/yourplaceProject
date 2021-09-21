package com.yourplace.host.management.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.management.service.HostManagementRoomService;
import com.yourplace.host.management.service.HostManagementService;
import com.yourplace.host.management.vo.HostManagementRoomVO;
import com.yourplace.host.management.vo.HostManagementVO;

@Controller
public class HostManagementController {
	
	@Inject
	HostManagementService service;
	
	@Inject
	HostManagementRoomService service2;
	
	@RequestMapping(value="/managementHostPlace.hdo")
	public ModelAndView allPlace(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HostManagementVO> list = service.getAllHostPlace();
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("userId");
		mav.setViewName("managementHostPlace");
		mav.addObject("list", list);
		mav.addObject("userId", id);
		
	
		return mav;
	}

	@RequestMapping(value="/deleteRoom.hdo", method=RequestMethod.GET )
	public String deleteRoom(@RequestParam("placeNum") int placeNum) throws Exception{
		service2.deleteRoom(placeNum);
		return "redirect:/managementHostRoomPlace.hdo";
	}
	
	
	@RequestMapping(value="/deletePlace.hdo", method=RequestMethod.GET)
	public String deletePlace(@RequestParam("placeNum") int placeNum) throws Exception{
		service.deletePlace(placeNum);
		return "redirect:/managementHostPlace.hdo";
	}
	
	
	@RequestMapping(value="/insertPlaceforHost.hdo")
	public ModelAndView insertPlaceView(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("userId");
		mav.setViewName("insertPlaceforHost");
		mav.addObject("userId", id);
		return mav;
	}
	
	@RequestMapping(value="/managementHostRoomPlace.hdo", method=RequestMethod.GET)
	public ModelAndView getRoom(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HostManagementRoomVO> roomlist = service2.getRoomList();
		mav.addObject("list2", roomlist);
		mav.setViewName("managementHostRoomPlace");
		return mav;
	}
	
	
	@RequestMapping(value="/getRoomValue.hdo", method=RequestMethod.POST)
	public String insertRoom(HttpServletRequest request)  throws Exception{
		
		return  "redirect:/managementHostRoomPlace.hdo";
		
	}


	
	

}
