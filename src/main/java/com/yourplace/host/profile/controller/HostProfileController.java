package com.yourplace.host.profile.controller;


import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.inject.Inject;
import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.host.profile.service.HostProfileService;
import com.yourplace.host.profile.vo.HostInfoUpdateVO;

@Controller
public class HostProfileController {
	
	@Inject
	private HostProfileService service;

	@RequestMapping(value="/updateProfileforHost.hdo")
	public ModelAndView hostProfile(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("userId");
		String snick = (String) session.getAttribute("userNick");
		String sinfo=(String)session.getAttribute("userInfo");
		String smail = (String)session.getAttribute("userMail");
		String stel = (String)session.getAttribute("userTel");
		
		mav.addObject("userId", sid);
		mav.addObject("userNick", snick);
		mav.addObject("userInfo", sinfo);
		mav.addObject("userMail", smail);
		mav.addObject("userTel", stel);

		mav.setViewName("profileUpdate");
		return mav;
	}

	@RequestMapping(value = "/myProfile.hdo", method = { RequestMethod.POST, RequestMethod.GET }) //이미지 key db에 저장 필요
	public ModelAndView viewProfile(Map<String, Object> param, HostInfoUpdateVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		if (vo.getUserProfileImg() != null) {
			
			AwsS3 awsS3 = AwsS3.getInstance();
			String contentType = vo.getUserProfileImg().getContentType();
			String fileName = vo.getUserProfileImg().getOriginalFilename();
			long filelength = vo.getUserProfileImg().getSize();

			File file = new File(fileName);
	

			String key = "profile/host/" + userId + "/thumbnail/" + fileName;
			System.out.println(contentType);
			System.out.println(fileName);
			
			
			System.out.println(key);
			

			awsS3.upload(file, key);	

			session.setAttribute("imgUrl", key);
			

				
		}
		
		mav.setViewName("myProfile");
		return mav;

	}

	@RequestMapping(value = "/getInfoValue.hdo", method = { RequestMethod.POST, RequestMethod.GET })
	public void getUserIntro(Map<String, Object> param, HostInfoUpdateVO vo, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");
			String userNick = vo.getUserNickName();
			String email = vo.getUserEmail();
			String userIntro = vo.getUserIntro();
			String url = (String) session.getAttribute("imgUrl");
			vo.setUserNickName(userNick);
			vo.setUserEmail(email);
			vo.setUserIntro(userIntro);
			vo.setUserId(userId);
			vo.setImgUrl(url);

			System.out.println(vo.toString());
			service.updateProfile(vo);

		
		
	}
}
