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

	@RequestMapping(value = "/hostSales.hdo")
	public ModelAndView getHostSales() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<HostSalesVO> list = service.getAllSales();
		mav.setViewName("hostSales");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/salesChartForHost.hdo")
	public ModelAndView getSalesChart() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<HostSalesVO> getChart = service.getAllSales();

		for (int i = 0; i <= getChart.size(); i++) {
			int invCost = getChart.get(i).getInvCost();
			mav.addObject("inv", invCost);

		}
		mav.setViewName("salesChartForHost");
		return mav;
	}
}
	


