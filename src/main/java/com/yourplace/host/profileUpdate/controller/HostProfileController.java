package com.yourplace.host.profileUpdate.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.service.HostProfileService;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateImgVO;
import com.yourplace.host.profileUpdate.vo.HostInfoUpdateVO;

@Controller
public class HostProfileController {
	@Inject
	private HostProfileService service;

	


	@RequestMapping(value = "/myProfile.hdo")
	public ModelAndView viewProfile(HttpServletRequest request, HostVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostVO> getList = service.getHostInfo(vo);
		
		for(int i=0; i<getList.size(); i++) {
			String userNickName = getList.get(i).getUserNickName();
			String userTel = getList.get(i).getUserTel();
			String userEmail = getList.get(i).getUserEmail();
			String userProfile = getList.get(i).getUserProfileImg();
			String userIntro = getList.get(i).getUserIntro();
		
		String imgBucket = "https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/";
		
		if(userProfile == null) {
			String img = "https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/profile/default/defaultprofile.png";
			mav.addObject("userImg", img);
		}else {
			mav.addObject("userImg", imgBucket + userProfile);
		}
		
		System.out.println(imgBucket+ userProfile);
		mav.addObject("userId", userId);
		mav.addObject("userNick", userNickName);
		mav.addObject("userInfo", userIntro);
		mav.addObject("userMail", userEmail);
		mav.addObject("userTel", userTel);
	
		
		mav.setViewName("myProfile");
		
	}
		return mav;
	}
	
	@RequestMapping(value = "/profileUpdate.hdo", method = { RequestMethod.POST, RequestMethod.GET })
	public void getUserImg(Map<String, Object> param, HostInfoUpdateImgVO vo, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		
			AwsS3 awsS3 = AwsS3.getInstance();
			String contentType = vo.getUserProfileImg().getContentType();
			String fileName = vo.getUserProfileImg().getOriginalFilename();
			long filelength = vo.getUserProfileImg().getSize();

			File file = new File(fileName);
	
			String key = "profile/host/" + userId + "/thumbnail/" + fileName;
			System.out.println(key);
			

			awsS3.upload(file, key);
		
			vo.setUserId(userId);
			vo.setImgUrl(key);
		

			service.updateProfileImg(vo);
			
		
	}
	

	@RequestMapping(value = "/getInfoValue.hdo", method = { RequestMethod.POST, RequestMethod.GET })
	public void getUserIntro(Map<String, Object> param,	HostInfoUpdateVO vo, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			
			String userId = (String) session.getAttribute("userId");
			
			String userNick = vo.getUserNickName();
			String email = vo.getUserEmail();
			String userIntro = vo.getUserIntro();
			
			
			vo.setUserNickName(userNick);
			vo.setUserEmail(email);
			vo.setUserIntro(userIntro);
			vo.setUserId(userId);
			System.out.println(vo.toString());
			
			service.updateProfile(vo);
	

			
		
	
	}
	
	@RequestMapping(value="/updateProfileforHost.hdo")
	public ModelAndView getHostInfo(HostVO vo, HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostVO> getList = service.getHostInfo(vo);
		
		for(int i=0; i<getList.size(); i++) {
			String userNickName = getList.get(i).getUserNickName();
			String userTel = getList.get(i).getUserTel();
			String userEmail = getList.get(i).getUserEmail();
			String userProfile = getList.get(i).getUserProfileImg();
			String userIntro = getList.get(i).getUserIntro();
		
		String imgBucket = "https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/";
		
		if(userProfile == null) {
			String img = "https://yourplacebuc.s3.ap-northeast-2.amazonaws.com/profile/default/defaultprofile.png";
			mav.addObject("userImg", img);
		}else {
			mav.addObject("userImg", imgBucket + userProfile);
		}
		
		System.out.println(imgBucket+ userProfile);
		mav.addObject("userId", userId);
		mav.addObject("userNick", userNickName);
		mav.addObject("userInfo", userIntro);
		mav.addObject("userMail", userEmail);
		mav.addObject("userTel", userTel);
	
		mav.setViewName("profileUpdate");
		
		
		}
		
		return mav;
		
	}
	
	

}

