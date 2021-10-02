package com.yourplace.host.refund.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.TextFormat.ParseException;
import com.yourplace.host.refund.service.RefundService;
import com.yourplace.host.refund.vo.RefundVO;

@Controller
public class refundController {
	
	@Inject
	private RefundService service;

	@RequestMapping(value="/refund.hdo")
	public ModelAndView refund(RefundVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setUserId(id);
		List<RefundVO> list = service.getAllDate(vo);
	
//오늘 날짜
		Date now = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
		String now1 = df.format(now);


		try {
			for(int i=0; i<=list.size(); i++) {
				
				
				
				String reserveYear =  Integer.toString(list.get(i).getReserveYear());
				String reserveMonth = Integer.toString(list.get(i).getReserveMonth());
				String reserveDate = Integer.toString(list.get(i).getReserveDate());
				
				String test1 = reserveYear.concat(reserveMonth).concat(reserveDate);
				java.util.Date date = df.parse(test1);
				System.out.println(date);
				
			}
		}catch(Exception e) {
			
		}
		
	
		
		getDate();
		System.out.println(list.toString());
		mav.setViewName("refund");
		return mav;
	}
	
	public void getDate() throws Exception{
		Date now = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
		String now1 = df.format(now);
		System.out.println(now1);
		
		String get[] = now1.split("-");
		int getYear = Integer.parseInt(get[0]);
		int getMonth = Integer.parseInt(get[1]);
		int getDate = Integer.parseInt(get[2]);
		
		System.out.println(getYear);
		System.out.println(getMonth);
		System.out.println(getDate);
		
		
	}

}