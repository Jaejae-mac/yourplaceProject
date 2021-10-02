package com.yourplace.host.review.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/reserveValue.hdo", method= {RequestMethod.GET, RequestMethod.POST})
	public static void getReserveValue(@RequestParam Map<String,Object> param, HostReviewVO vo, HttpServletRequest request)throws Exception{
		try {
		System.out.println(param.toString());
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		String placeNum = (String) param.get("placeNum[]");
		String reserveNum = (String) param.get("reserveNum[]");
		String reserveId = (String) param.get("reserveId[]");
		
		String star = (String) param.get("star=");
		String con = (String) param.get("contents=");
		
		String[] str = placeNum.split("/");

		String placeNumm = str[1].trim();
		int reserveNumm = Integer.parseInt(reserveNum);
		

		
		System.out.println(star);
		System.out.println(con);
		
		vo.setMemId(userId);
		vo.setPlaceNum(placeNumm);
		vo.setReservNum(reserveNumm);
		vo.setReserveId(reserveId);
		
		}catch(NullPointerException e) {
			
		}
//			service.insertReviewForHost(vo);
	}
	
		
	


	
//	@RequestMapping(value = "/reviewValue.hdo", method = { RequestMethod.GET, RequestMethod.POST })
//	public static void getReviewValue(HostReviewVO vo, @RequestParam Map<String, Object> param, HttpServletRequest request) throws Exception {
//		String star = (String) param.get("star");
//		String con = (String) param.get("contents");
//		int Fstar = Integer.parseInt(star);
//		
//		vo.setStar(Fstar);
//		vo.setReview(con);
//		
//		System.out.println(vo.toString());
//
//	}
	
	@RequestMapping(value="/reviewForGuest.hdo")
	public ModelAndView	reviewForm(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewPopup");
		return mav;
	}
	
	
	

}
