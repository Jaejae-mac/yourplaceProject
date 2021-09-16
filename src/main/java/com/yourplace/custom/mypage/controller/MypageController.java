package com.yourplace.custom.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.service.MyPageDeleteService;
import com.yourplace.custom.mypage.service.MyPageService;
import com.yourplace.custom.mypage.service.MyPageUpdateService;

@Controller
public class MypageController {
	@Autowired
	private MyPageService mypageService;
	@Autowired
	private MyPageUpdateService mypageupdateService;
	@Autowired
	private MyPageDeleteService mypagedeleteService;
	
	@RequestMapping("/mypage.do")
	public String mypageForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", mypageService.getUser(vo));
		return "mypage/mypage";
	}
	@RequestMapping("/gopagefix.do")
	public String goMypagefix(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", mypageService.getUser(vo));
		System.out.println(model);
		return "mypage/mypagefix";
	}
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) throws IOException{
		System.out.println("[mypageController] updateUser 기능");
		System.out.println(vo.toString());
		mypageupdateService.updateUser(vo);
		return "redirect:mypage.do";
	}
	@RequestMapping("/deleteUser.do")
	public String deleteBoard(HttpServletRequest request) {
		System.out.println("[mypageController] deleteUser 기능");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println("유저 아이디" + userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		mypagedeleteService.deleteUser(vo);
		session.invalidate();
		return "redirect:home.do";
	}
}
