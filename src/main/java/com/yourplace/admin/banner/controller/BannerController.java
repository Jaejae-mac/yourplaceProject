package com.yourplace.admin.banner.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yourplace.admin.banner.service.AvailableService;
import com.yourplace.admin.banner.service.BannerNumService;
import com.yourplace.admin.banner.service.GetListService;
import com.yourplace.admin.banner.service.InsertUploadService;
import com.yourplace.admin.banner.service.UploadService;
import com.yourplace.admin.banner.vo.BannerVO;
import com.yourplace.admin.coupon.user.vo.CouponUserVO;


@Controller
public class BannerController {

	@Autowired
	private UploadService uploadService;
	
	@Autowired
	private GetListService getlistService;
	
	@Autowired
	private BannerNumService getBannerNum;
	
	@Autowired
	private AvailableService avilableService;
	
	
	@GetMapping(value="/controlBanner.mdo")
	public void bannerManage(Model model)
	{
		System.out.println("[Controller] Banner Control Page 호출");
		List<BannerVO> vo = getlistService.getBannerList();
		model.addAttribute("bannerList", vo);
		
	}
	
	@PostMapping(value="/uploadBannerImg.mdo")
	public String uploadBanner(MultipartHttpServletRequest mtfRequest, HttpServletRequest request)
	{
		int bannerNum = getBannerNum.getBannerNum();
		String url = request.getParameter("url");
		
		System.out.println("setting 할 번호: " + bannerNum);
		System.out.println("기재한 url: " + url);
		
		
		uploadService.uploadFile(mtfRequest, bannerNum, url); //uploadFile 안에서 insertUploadImg 까지 처리
		
		return "redirect:controlBanner.mdo";
	}
	
	
	//배너 공개 페이지 호출
	@GetMapping(value="/applyBanner.mdo")
	public String ableBanner()
	{
		return "applyBanner";
	}
	
	//배너 공개 처리
	@PostMapping(value="/applyBanner.mdo")
	public String openBanner(@RequestParam("sendBannerName") List<String>bannerNum)
	{
		System.out.println("[Controller] 배너 상태 : 공개로 전환");
		System.out.println(bannerNum.toString());
		
		for(int i = 0; i < bannerNum.size(); i++)
		{
			String num = bannerNum.get(i);
			avilableService.ableBanner(num);
		}
		
		System.out.println("정상 처리되었습니다.");
		
		return "redirect:controlBanner.mdo";
	}
	
	
	//배너 비공개 페이지 호출
	@GetMapping(value="/nonapplyBanner.mdo")
	public String disableBanner()
	{
		return "nonapplyBanner";
	}
	
	//배너 비공개 처리
	@PostMapping(value="/nonapplyBanner.mdo")
	public String sendCoupon(@RequestParam("disableBannerName") List<String>bannerNum)
	{
		System.out.println("[Controller] 배너 상태 : 비공개로 전환");
		System.out.println(bannerNum.toString());
		
		for(int i = 0; i < bannerNum.size(); i++)
		{
			String num = bannerNum.get(i);
			avilableService.disableBanner(num);
		}
		
		System.out.println("정상 처리되었습니다.");
		
		return "redirect:controlBanner.mdo";
	}
	
	
	
}
