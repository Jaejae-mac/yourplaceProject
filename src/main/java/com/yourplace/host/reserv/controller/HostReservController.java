package com.yourplace.host.reserv.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
		try {
			for(int i=0; i<=list.size(); i++) {
				String reserveDate = Integer.toString(list.get(i).getReserveYear())+"-" + Integer.toString(list.get(i).getReserveMonth())+"-" + Integer.toString(list.get(i).getReserveDate());
		
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
				Date reserveDa = sdf.parse(reserveDate);
//				System.out.println(today);
//				
//				System.out.println(reserveDa);
//				
				boolean before = reserveDa.before(today);
//				System.out.println(before);
				if(before == true) {
					
					String placeName = list.get(i).getPlaceName();
					String reserveNum = list.get(i).getReserveNum();
					String reserveId = list.get(i).getReserveId();
					String placeNum = list.get(i).getPlaceNum();
					String reserveName = list.get(i).getReserveName();
					String StartTime = Integer.toString(list.get(i).getStartTime()) +"시";
					String endTime = Integer.toString(list.get(i).getEndTime()) + "시";
					String personNum = Integer.toString(list.get(i).getPersonNum()) + "명";
					String payPrice = Integer.toString(list.get(i).getPayPrice());
					
					
					Map<String, Object> map = new HashMap<String, Object>();
		
					
					map.put("placeName", placeName);
//					 getBeforeReserve.add(reserveNum);
//					 getBeforeReserve.add(reserveId);
//					 getBeforeReserve.add(placeNum);
//					 getBeforeReserve.add(reserveName);
//					 getBeforeReserve.add(StartTime);
//					 getBeforeReserve.add(endTime);
//					 getBeforeReserve.add(personNum);
//					 getBeforeReserve.add(payPrice);
					
					mav.addObject("beforeList", map);	
					System.out.println(map.toString());
				
				}else {
					
				}
			}
	
		}catch(Exception e) {
			
		}
		mav.setViewName("LastReserveListForHost");
		return mav;
	}

}




	
	
	
	
