package com.yourplace.host.review.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.review.service.HostReviewService;
import com.yourplace.host.review.vo.HostReviewVO;

@Controller
public class HostReviewController {
	
	@Inject
	HostReviewService service;
	
	@RequestMapping(value="/hostReviews.hdo") //ok
		public ModelAndView Review(HttpServletRequest request, HostReviewVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("userId");
		vo.setMemId(memId);

		List<HostReviewVO> list = service.getReviewList(vo);
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
		mav.addObject("userId", memId);

		return mav;
	}

	@RequestMapping(value = "/reserveValue.hdo", method = { RequestMethod.POST, RequestMethod.GET })
	public static void getReserveValue(HostReviewVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String placeN = vo.getPlaceNum();
		String reserveId = vo.getReserveId();
		int reserveNum = vo.getReservNum();
		
		session.setAttribute("reserveNum", reserveNum);
		session.setAttribute("plNum", placeN);
		session.setAttribute("reserveId", reserveId);

	}

	
	@RequestMapping(value="/reviewVal.hdo",  method = {RequestMethod.POST, RequestMethod.GET})
	public void getReValue(HttpServletRequest request, Map<String, Object> param, HostReviewVO vo) throws Exception{
		HttpSession session =request.getSession();
		int star = vo.getStar();
		String content = vo.getReview();
		
		String placeNum = (String)session.getAttribute("plNum");
		String reserveId = (String)session.getAttribute("reserveId");
		String userId = (String) session.getAttribute("userId");

		
		int reserveNum = (Integer) session.getAttribute("reserveNum");
		
		
		vo.setMemId(userId);
		vo.setStar(star);
		vo.setReview(content);
		vo.setPlaceNum(placeNum);
		vo.setReserveId(reserveId);
		vo.setReservNum(reserveNum);
		
		service.insertReviewForHost(vo);
		service.updateReviewYN(vo);
		
		
		
	}
		
	



	
	@RequestMapping(value="/reviewForGuest.hdo",  method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView reviewForm() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewPopup");
		return mav;
		
	}
	
	
	

}
