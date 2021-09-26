package com.yourplace.host.review.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println(list.toString());
		mav.setViewName("hostReviews");
		mav.addObject("list", list);
		mav.addObject("userId", memId);

		return mav;
	}
	
//	
//	@RequestMapping(value="/insertReview.hdo", method=RequestMethod.POST) //값 출력까지 ok
//	public void insertReview(HttpServletRequest request, HostReviewVO vo) throws Exception{
//		HttpSession session = request.getSession();
//		
//		String memId = (String)session.getAttribute("userId");
//		String review = request.getParameter("content");
//		
//		System.out.println(review);
//		System.out.println(memId);
//	}
//	
	
	@RequestMapping("/reviewForGuest.hdo")
	public ModelAndView	reviewForm(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String placeNum = request.getParameter("placeNum");
		System.out.println(placeNum);
		
		mav.setViewName("reviewPopup");
		return mav;
	}
	
	
	
	@PostMapping("/reviewInsert.hdo")
	public void reviewInsert() throws Exception{
		
	}

}
