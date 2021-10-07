package com.yourplace.host.refund.controller;

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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.refund.service.RefundService;
import com.yourplace.host.refund.vo.RefundVO;

@Controller
public class refundController {
	
	@Inject
	private RefundService service;

	@RequestMapping(value = "/refund.hdo")
	public ModelAndView refund(RefundVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		vo.setUserId(id);
		List<RefundVO> list = service.getAllDate(vo);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);

		Calendar calendar = Calendar.getInstance();

		Date today = calendar.getTime();
		System.out.println("지금 날짜" + today.toLocaleString());
		
		
		List<Object> valueList = new ArrayList<Object>();
		
//		List<RefundVO> value = new ArrayList<RefundVO>();

		
		for (int i = 0; i < list.size(); i++) {
			String reserve = Integer.toString(list.get(i).getReserveYear()) + "-"
					+ Integer.toString(list.get(i).getReserveMonth()) + "-"
					+ Integer.toString(list.get(i).getReserveDate()) + "-"
					+ Integer.toString(list.get(i).getStartTime());
			Date reserveDate = sdf.parse(reserve); // 예약 날짜

			if(today.before(reserveDate)) {
			
					String rId = list.get(i).getReserveId();
					String placeName = list.get(i).getPlaceName();
					String placeNum = list.get(i).getPlaceNum();
					String reserveNum = list.get(i).getReserveNum();
					int stTime = list.get(i).getStartTime();
					int endTime = list.get(i).getEndTime();
					int pNum = list.get(i).getPersonNum();
					int price = list.get(i).getPayPrice();
					String reserveDatee = sdf.format(reserveDate);
					
					RefundVO voo = new RefundVO();
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
			mav.setViewName("refund");
		return mav;
	
	}
	
	@RequestMapping(value = "/refundForHost.hdo")
	public ModelAndView refundreserveNum(HttpServletRequest request,  Map<String, Object> param, RefundVO vo) throws Exception {
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			String reserveNum = vo.getReserveNum();
			session.setAttribute("reservNum", reserveNum);
			
			mav.setViewName("refundPopup");
			return mav;
	}
	
	@RequestMapping(value = "/refundReason.hdo")
	public void refundPop(HttpServletRequest request, Map<String, Object> param, RefundVO vo)throws Exception{
		HttpSession session = request.getSession();
		String reserveNum = (String)session.getAttribute("reservNum");
		String refundReason = vo.getRefundReason();
	
		vo.setReserveNum(reserveNum);
		vo.setRefundReason(refundReason);
		
		service.update(vo);
		
		System.out.println(refundReason);
	}
	
	@RequestMapping(value="/refundRequest.hdo")
	public ModelAndView refundRequest(RefundVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		List<RefundVO> getRefundRequestList = service.getRefund(vo);
		System.out.println(getRefundRequestList.toString());
		mav.addObject("list", getRefundRequestList);
		mav.setViewName("refundRequest");
		return mav;
		
	}

	
	
}