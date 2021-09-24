package com.yourplace.admin.revenue.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yourplace.admin.revenue.service.RevenueMonthService;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Controller
public class RevenueController {
	
	@Autowired
	private RevenueMonthService revenueMonthService;
	
//	@GetMapping(value="/revenueView.mdo")
//	public String revenueViewForm()
//	{
//		return "revenueView";
//	}
	
	@GetMapping(value="/revenueView.mdo")
	public @ResponseBody String chartView(Model model)
	{
		Gson gson = new Gson();
		List<RevenueVO> list = revenueMonthService.getMonthSum();
		return gson.toJson(list);
	}
	
}
