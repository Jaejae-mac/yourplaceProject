package com.yourplace.host.reserv.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.header.writers.frameoptions.StaticAllowFromStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.refund.vo.RefundVO;
import com.yourplace.host.reserv.service.HostReservService;
import com.yourplace.host.reserv.vo.HostReservVO;

@Controller
public class HostReservController {
	@Inject
	HostReservService service;

	@RequestMapping(value = "/placeReserveListForHost.hdo", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView getHostReservList(HttpServletRequest request, HostReservVO vo) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		vo.setUserId(id);
		List<HostReservVO> list = service.getAllReserve(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("placeReserveListForHost");
		return mav;
	}

	

	@RequestMapping(value = "/LastPlaceReserveListForHost.hdo") // 일 기준 추가해야함
	public ModelAndView lastReserveList(HostReservVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		vo.setUserId(id);
		List<HostReservVO> list = service.lastReserve(vo);

		System.out.println(list.toString());
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);

		Calendar calendar = Calendar.getInstance();

		Date today = calendar.getTime();
		System.out.println("지금 날짜" + today.toLocaleString());
		
		
		List<Object> valueList = new ArrayList<Object>();
		


		
		for (int i = 0; i < list.size(); i++) {
			String reserve = Integer.toString(list.get(i).getReserveYear()) + "-"
					+ Integer.toString(list.get(i).getReserveMonth()) + "-"
					+ Integer.toString(list.get(i).getReserveDate()) + "-"
					+ Integer.toString(list.get(i).getStartTime());
			Date reserveDate = sdf.parse(reserve); // 예약 날짜

			if(today.after(reserveDate)) {
			
					String rId = list.get(i).getReserveId();
					String placeName = list.get(i).getPlaceName();
					String placeNum = list.get(i).getPlaceNum();
					String reserveNum = list.get(i).getReserveNum();
					int stTime = list.get(i).getStartTime();
					int endTime = list.get(i).getEndTime();
					int pNum = list.get(i).getPersonNum();
					int price = list.get(i).getPayPrice();
					String reserveDatee = sdf.format(reserveDate);
					
					HostReservVO voo = new HostReservVO();
					voo.setReserveId(rId);
					voo.setPlaceName(placeName);
					voo.setPlaceNum(placeNum);
					voo.setReserveNum(reserveNum);
					voo.setStartTime(stTime);
					voo.setEndTime(endTime);
					voo.setPersonNum(pNum);
					voo.setPayPrice(price);
					voo.setReserveDatee(reserveDatee);
					
					valueList.add(voo);
				
				}
			

			
		}
			
			

			
			mav.addObject("list", valueList);
			mav.setViewName("LastReserveListForHost");
		return mav;
	
	}
	
	@RequestMapping(value="/reserveNum.hdo" , method= {RequestMethod.POST, RequestMethod.GET})
	public void reserveValue(HttpServletRequest request, HostReservVO vo, Map<String, Object> param)throws Exception{
		String reserveNum = vo.getReserveNum();
		System.out.println(reserveNum);
		HttpSession session = request.getSession();
		session.setAttribute("reserveNum", reserveNum);
	}
	
	
	
	
	
	@RequestMapping(value="/reserveDetail.hdo" , method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView reserveDetail(HttpServletRequest request, HostReservVO vo)throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		List<HostReservVO> list = service.getAllReserve(vo);
		
		List<HostReservVO> getList = new ArrayList<HostReservVO>();

		String reserveNum = (String)session.getAttribute("reserveNum");
		System.out.println(reserveNum + "테스트");
		
		for(int i=0; i<list.size(); i++) {
			String reserveNumm = list.get(i).getReserveNum();
			
			if(reserveNum.equals(reserveNumm)) {
				String reserveTel = list.get(i).getReserveTel();
				String detailNum = list.get(i).getPlaceDetailNum();
				String reserveRequest = list.get(i).getReserveRequest();
				String reservePurpose = list.get(i).getReservePurpose();
			
				vo.setReserveTel(reserveTel);
				vo.setPlaceDetailNum(detailNum);
				vo.setReserveRequest(reserveRequest);
				vo.setReservePurpose(reservePurpose);
				
				
				getList.add(vo);
				session.removeAttribute("reserveNum");
				
		}
		}
		System.out.println(getList);
		mav.addObject("get", getList);

		mav.setViewName("reserveDetailPopup");

		return mav;
	}
	

	

}




	
	
	
	
