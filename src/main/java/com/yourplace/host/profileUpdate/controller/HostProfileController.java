package com.yourplace.host.profileUpdate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.custom.login.service.LoginUserService;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.service.MyPageUpdateService;
import com.yourplace.host.login.service.HostLoginService;
import com.yourplace.host.login.vo.HostVO;
import com.yourplace.host.profileUpdate.service.HostProfileService;

@Controller
public class HostProfileController {
	@Autowired
	private HostLoginService hostloginService;
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
			String userName = getList.get(i).getUserName();
		
		if(userProfile == null) {
			String img = "profile/default/defaultprofile.png";
			mav.addObject("userImg", img);
		}else {
			mav.addObject("userImg", userProfile);
		}
		
		System.out.println(userProfile);
		mav.addObject("userId", userId);
		mav.addObject("userNick", userNickName);
		mav.addObject("userInfo", userIntro);
		mav.addObject("userMail", userEmail);
		mav.addObject("userTel", userTel);
		mav.addObject("userName", userName);
		
		mav.setViewName("myProfile");
		
	}
		return mav;
	}
	//비밀번호 확인 페이지 이동
	@RequestMapping("/gocheckPw.hdo")
	public String gocheckPw(HttpServletRequest request,HostVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		mav.addObject("userId",userId);
		return "myProfilePassCheck";
	}
	//비밀번호 변경페이지 이동
		@RequestMapping("/gochangPw.hdo")
		public String MypageChangPw(HostVO vo, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			System.out.println("[MypageController MypageChangPw 기능 수행]");
			HostVO result = hostloginService.getHostLogin(vo);
			if(result.getLoginCheck() == 1) {
				HttpSession session = request.getSession();
				String userId = (String)session.getAttribute("userId");
				mav.addObject("userId",userId);
				return "myProfilePassChange";
			}else {
				mav.addObject("result", 0);
				return "myProfilePassCheck";
			}
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
				int userNum = getList.get(i).getUserNum();

			
			if(userProfile == null) {
				String img = "profile/default/defaultprofile.png";
				mav.addObject("userImg", img);
			}else {
				mav.addObject("userImg", userProfile);
			}
			
			System.out.println(userProfile);
			mav.addObject("userId", userId);
			mav.addObject("userNick", userNickName);
			mav.addObject("userInfo", userIntro);
			mav.addObject("userMail", userEmail);
			mav.addObject("userTel", userTel);
			mav.addObject("userNum", userNum);
			
			mav.setViewName("profileUpdate");	
			}		
			return mav;		
		}
}

