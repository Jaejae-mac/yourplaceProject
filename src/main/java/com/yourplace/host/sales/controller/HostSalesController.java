package com.yourplace.host.sales.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.sales.service.HostSalesService;
import com.yourplace.host.sales.vo.HostSalesVO;

@Controller
public class HostSalesController {
	@Inject
	private HostSalesService service;
	
	@RequestMapping(value="/hostSales.hdo")
	public ModelAndView getHostSales() throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HostSalesVO> list = service.getAllSales();
		mav.setViewName("hostSales");
		mav.addObject("list", list);
		return mav;
	}
}
