package com.yourplace.host.review.controller;

import java.util.List;

import javax.inject.Inject;

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
		public ModelAndView Review() throws Exception{
		List<HostReviewVO> list = service.getReviewList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
//		System.out.println(mav.toString());
		return mav;
	}
}
