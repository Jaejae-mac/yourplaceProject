package com.yourplace.admin.banner.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BannerController {

//	@Autowired
//	private 
	
	@GetMapping(value="/controlBanner.mdo")
	public String bannerManage()
	{
		System.out.println("[Controller] Banner Control Page 호출");
		return "controlBanner";
	}
	
	@PostMapping(value="/uploadBannerImg.mdo")
	public String uploadBanner(Model model, File file)
	{
		
		return "redirect:contorlBanner.mdo";
	}
	
}
