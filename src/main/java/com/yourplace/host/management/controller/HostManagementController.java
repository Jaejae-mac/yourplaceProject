package com.yourplace.host.management.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView allPlace(HttpServletRequest request, HostManagementVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		List<HostManagementVO> list = service.getAllHostPlace(vo);
		mav.setViewName("managementHostPlace");
		mav.addObject("list", list);
		mav.addObject("userId", userId);
		System.out.println(userId);
		return mav;
	}
	

	@RequestMapping(value="/deleteRoom.hdo", method=RequestMethod.GET )
	public String deleteRoom(@RequestParam("detailNum") String detailNum) throws Exception{
		service2.deleteRoom(detailNum);
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
	public ModelAndView getRoom(HttpServletRequest request, HostManagementRoomVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		
		List<HostManagementRoomVO> roomlist = service2.getRoomList(vo);
		System.out.println(roomlist.toString());
		mav.addObject("userId", userId);
		mav.addObject("list2", roomlist);
		mav.setViewName("managementHostRoomPlace");
		return mav;
	}
	
	@GetMapping("/getRoomVlaue.hdo")
	public String insertRoom(HttpServletRequest request, HostManagementRoomVO vo) throws Exception {
		HttpSession session = request.getSession();
		
		int placeNum = Integer.parseInt(String.valueOf(session.getAttribute("placeNum")));
		
		String detailNum = request.getParameter("roomNum");
		String roomname = request.getParameter("detailTitle"); //방 이름
		String roomPer = request.getParameter("detailPersonNum"); //인원수
		String extra = request.getParameter("surcharge"); //할증
		
//		System.out.println(roomname + roomPer + extra);
//		System.out.println(detailNum);
		
		vo.setDetailNum(detailNum);
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		
		service2.insertRoom(vo);
		
		return "redirect:/managementHostRoomPlace.hdo";

	}
	
	
	@RequestMapping(value="/updatePlaceDetail.hdo", method=RequestMethod.GET)
	public ModelAndView updatePlaceDetail(HttpServletRequest request, HostManagementVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId= (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		int placeNum = Integer.parseInt(request.getParameter("placeNum"));
		vo.setPlaceNum(placeNum);
		System.out.println(placeNum);
		List<HostManagementVO> getList = service.getOneHostPlace(vo);
		
		
		
		System.out.println(getList.toString());
		mav.addObject("updatePlace", getList);
		mav.setViewName("update");
		return mav;
		
	}


	

}