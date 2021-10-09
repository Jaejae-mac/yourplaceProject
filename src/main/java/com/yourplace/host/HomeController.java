package com.yourplace.host;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.reserv.service.HostReservService;
import com.yourplace.host.reserv.vo.HostReservVO;

@Controller

public class HomeController {
	@Inject
	HostReservService service;
	
	@RequestMapping(value= "/indexYourPlace.hdo")
	public ModelAndView mainView(HttpServletRequest request, HostReservVO vo) throws Exception {
		List<HostReservVO> list = service.getAllReserve(vo);
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("userId");
//		System.out.println(id);
		mav.addObject("list", list);
		mav.addObject("userId", id);
		mav.setViewName("indexOurPlace");

		return mav;
		
	}
	

}
