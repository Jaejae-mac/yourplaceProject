package com.yourplace.admin.banner.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yourplace.admin.banner.service.BannerNumService;
import com.yourplace.admin.banner.service.GetListService;
import com.yourplace.admin.banner.service.InsertUploadService;
import com.yourplace.admin.banner.service.UploadService;
import com.yourplace.admin.banner.vo.BannerVO;


@Controller
public class BannerController {

	@Autowired
	private UploadService uploadService;
	
	@Autowired
	private GetListService getlistService;
	
	@Autowired
	private InsertUploadService inserUpload;
	
	@Autowired
	private BannerNumService getBannerNum;
	
	
	@GetMapping(value="/controlBanner.mdo")
	public void bannerManage(Model model)
	{
		System.out.println("[Controller] Banner Control Page 호출");
		List<BannerVO> vo = getlistService.getBannerList();
		model.addAttribute("bannerList", vo);
		
	}
	
	@PostMapping(value="/uploadBannerImg.mdo")
	public String uploadBanner(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, BannerVO vo)
	{
		int num;
		//uploadService.uploadFile(mtfRequest, num);
		return "redirect:contorlBanner.mdo";
	}
	
}
