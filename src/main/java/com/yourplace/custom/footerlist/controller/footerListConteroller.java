package com.yourplace.custom.footerlist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class footerListConteroller {

	@RequestMapping("/footerbs.do")
	public String footerbsView() {
		return "footerList/footerBS";
	}
	
	@RequestMapping("/footerpv.do")
	public String footerpvView() {
		return "footerList/footerPV";
	}
	
	@RequestMapping("/footertos.do")
	public String footertosView() {
		return "footerList/footerTOS";
	}
	
	@RequestMapping("/footertr.do")
	public String footertrView() {
		return "footerList/footerTR";
	}
}
