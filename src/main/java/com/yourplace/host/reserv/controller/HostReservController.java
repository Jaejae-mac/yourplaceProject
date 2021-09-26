package com.yourplace.host.reserv.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	
	@RequestMapping(value="/placeReserveListForHost.hdo")
	public ModelAndView getHostReservList(HttpServletRequest request, HostReservVO vo) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setUserId(id);
		List<HostReservVO> list = service.getAllReserve(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("placeReserveListForHost");
		return mav;
		
	}
	
	@RequestMapping(value="/LastPlaceReserveListForHost.hdo") //오늘날짜 기준인거 못함
	public ModelAndView lastReserveList(HostReservVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setUserId(id);
		List<HostReservVO> list = service.lastAllReserve(vo);
		System.out.println(list.toString());
		
		String placeNum = request.getParameter("placeNum");
		System.out.println(placeNum);
		
		try {
			for(int i=0; i<=list.size(); i++) {
				int year = list.get(i).getReserveYear();
				int month = list.get(i).getReserveMonth();
				int date = list.get(i).getReserveDate();
				
				String parseDate = Integer.toString(year) + Integer.toString(month) + Integer.toString(date);
				
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date finaldate = transFormat.parse(parseDate);
				
				System.out.println(finaldate.toString());

	
			}
		}catch(Exception e) {
			
		}
		
		
		mav.addObject("list", list);
		mav.setViewName("LastReserveListForHost");
		return mav;
	}

}




	
	
	
	
