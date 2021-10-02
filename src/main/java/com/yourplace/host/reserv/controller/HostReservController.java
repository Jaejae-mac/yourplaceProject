package com.yourplace.host.reserv.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

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
	
	@RequestMapping(value="/LastPlaceReserveListForHost.hdo") //일 기준 추가해야함
	public ModelAndView lastReserveList(HostReservVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setUserId(id);
		List<HostReservVO> list = service.lastAllReserve(vo);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm",Locale.KOREA);
		
		Calendar cal = Calendar.getInstance(); 
		String now = sdf.format(cal.getTime());
		String[] str = now.split("-");
		System.out.println(now);
		
		int year = Integer.parseInt(str[0]);
		int month = Integer.parseInt(str[1]);
		int date = Integer.parseInt(str[2]);
		
		int hour = Integer.parseInt(str[3]);
	
		
		LinkedHashMap<String, Object> LastReserveList = new LinkedHashMap<String, Object>(); 
	
		
		try {
			for(int i=0; i<=list.size(); i++) {
				String reserveDate = Integer.toString(list.get(i).getReserveYear())+"-" + Integer.toString(list.get(i).getReserveMonth())+"-" + Integer.toString(list.get(i).getReserveDate()) + "-" + Integer.toString(list.get(i).getStartTime());
				String[] rstr = reserveDate.split("-");
				
				int rYear = Integer.parseInt(rstr[0]);
				int rMonth = Integer.parseInt(rstr[1]);
				int rDate = Integer.parseInt(rstr[2]);
				
				int rHour = Integer.parseInt(rstr[3]);
			
				System.out.println(rYear +"," + rMonth + "," + rDate );
				
				String rId = list.get(i).getReserveId();
				String placeName = list.get(i).getPlaceName();
				String placeNum = list.get(i).getPlaceNum();
				String reserveNum = list.get(i).getReserveNum();
				int stTime = list.get(i).getStartTime();
				int endTime = list.get(i).getEndTime();
				int pNum = list.get(i).getPersonNum();
				int price = list.get(i).getPayPrice();
				
				if(year>=rYear && month>=rMonth) {
					LastReserveList.put("reserveYear", rYear);
					LastReserveList.put("reserveMonth", rMonth);
					LastReserveList.put("reserveDate", rDate);
					LastReserveList.put("placeName", placeName);
					LastReserveList.put("placeNum", placeNum);
					LastReserveList.put("reserveNum", reserveNum);
					LastReserveList.put("start", stTime);
					LastReserveList.put("endTime", endTime);
					LastReserveList.put("personNum", pNum);
					LastReserveList.put("price", price);
					System.out.println(LastReserveList.toString());
				}
				
		
			}
		
			
		}catch(Exception e) {
			
		}
		
		mav.setViewName("LastReserveListForHost");
		return mav;
	}
}






	
	
	
	
