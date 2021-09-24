package com.yourplace.host.review.controller;

import java.util.List;

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
	
	@RequestMapping(value="/hostReviews.hdo")
		public ModelAndView Review(HttpServletRequest request, HostReviewVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setMemId(id);
		List<HostReviewVO> list = service.getReviewList(vo);
		System.out.println(list.toString());
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
		mav.addObject("userId", id);
//		System.out.println(mav.toString());
		return mav;
	}
	
	
	@RequestMapping(value="/insertReview.hdo", method=RequestMethod.POST)
	public ModelAndView insertReview(HttpServletRequest request, HostReviewVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("userId");
		String review = request.getParameter("content");
		System.out.println(review);
		System.out.println(memId);
		mav.setViewName("insertReviewForm");
		return mav;
	}
	
}
