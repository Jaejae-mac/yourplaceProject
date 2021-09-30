package com.yourplace.host.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		System.out.println(list.toString());
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
		mav.addObject("userId", memId);

		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/getReserveValue.hdo", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> test(@RequestParam HashMap params) throws Exception {
			System.out.println(params);
			return params;
		
	

	}
	
	
	
	@RequestMapping(value="/reviewValue.hdo", method= {RequestMethod.GET, RequestMethod.POST})
	public void getReviewValue(HttpServletRequest request) throws Exception{
		int star = Integer.parseInt(request.getParameter("star"));
		System.out.println(star);
		String reviewContent = request.getParameter("contents");
		System.out.println(reviewContent);
	
		

		
	}
	
	@RequestMapping(value="/reviewForGuest.hdo")
	public ModelAndView	reviewForm(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewPopup");
		return mav;
	}
	
	
	

}
