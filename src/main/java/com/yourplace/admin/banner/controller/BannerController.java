package com.yourplace.admin.banner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BannerController {

	
	
	@GetMapping(value="/controlBanner.mdo")
	public String bannerManage()
	{
		System.out.println("[Controller] Banner Control Page 호출");
		return "controlBanner";
	}
	
	@PostMapping(value="/uploadBannerImg.mdo")
	public String uploadBanner(Model model, MultipartFile file)
	{
		
		return "redirect:contorlBanner.mdo";
	}
	
}
