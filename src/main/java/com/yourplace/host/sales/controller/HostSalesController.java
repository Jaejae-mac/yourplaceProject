package com.yourplace.host.sales.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.sales.service.HostSalesService;
import com.yourplace.host.sales.vo.HostSalesVO;

@Controller
public class HostSalesController {
	@Inject
	private HostSalesService service;

	@RequestMapping(value = "/hostSales.hdo")
	public ModelAndView getHostSales(HostSalesVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostSalesVO> list = service.getAllSales(vo);
		System.out.println(list.toString());
		mav.setViewName("hostSales");
		mav.addObject("list", list);
		return mav;
	}

}
	


