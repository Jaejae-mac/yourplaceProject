package com.yourplace.host.review.controller;

import java.util.List;

import javax.inject.Inject;
<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
=======
>>>>>>> 048c1b2f8ce36b365d8039112f0f3e58c6ee13f1

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.review.service.HostReviewService;
import com.yourplace.host.review.vo.HostReviewVO;

@Controller
public class HostReviewController {
	@Inject
	HostReviewService service;
	
	@RequestMapping(value="/hostReviews.hdo")
<<<<<<< HEAD
		public ModelAndView Review(HttpServletRequest request) throws Exception{
		List<HostReviewVO> list = service.getReviewList();
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
		mav.addObject("userId", id);
=======
		public ModelAndView Review() throws Exception{
		List<HostReviewVO> list = service.getReviewList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
>>>>>>> 048c1b2f8ce36b365d8039112f0f3e58c6ee13f1
//		System.out.println(mav.toString());
		return mav;
	}
}
