package com.yourplace.admin.revenue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RevenueController {

	@GetMapping(value="/revenueView.mdo")
	public void revenueViewForm()
	{
		
	}
	
}
