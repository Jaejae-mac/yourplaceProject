package com.yourplace.custom.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.service.MyPageReserveService;
import com.yourplace.custom.mypage.service.MyPageService;
import com.yourplace.custom.mypage.service.MyPageUpdateService;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;

@Controller
public class MyPageReserveController {
	@Autowired
	private MyPageReserveService reserveservice;
	@Autowired
	private MyPageService mypageService;
	
	@RequestMapping("/goreserve.do")
	public String goreserve(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", mypageService.getUser(vo));
		return "mypage/mypageReserve";
	}
	@RequestMapping("/reserveListIng.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveList(HttpServletRequest request) {
		System.out.println("[controller getReserveList 기능 수행]");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setRsvId(userId);
		List<MyPageReserveVO> tvo =reserveservice.getMyReserveList(vo);
		System.out.println(tvo);
		return tvo;
	}
	@RequestMapping("/reserveListAll.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListAll(HttpServletRequest request) {
		System.out.println("[controller getReserveListAll 기능 수행]");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setRsvId(userId);
		List<MyPageReserveVO> tvo =reserveservice.getMyReserveListAll(vo);
		System.out.println(tvo);
		return tvo;
	}
	@RequestMapping("/reserveListEnd.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListEnd(HttpServletRequest request) {
		System.out.println("[controller getReserveListEnd 기능 수행]");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setRsvId(userId);
		System.out.println(vo);
		List<MyPageReserveVO> tvo =reserveservice.getMyReserveListEnd(vo);
		System.out.println(tvo);
		return tvo;
	}
	@RequestMapping("/reserveListCancel.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListCancel(HttpServletRequest request) {
		System.out.println("[controller getReserveListCancel 기능 수행]");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setRsvId(userId);
		System.out.println(vo);
		List<MyPageReserveVO> tvo =reserveservice.getMyReserveListCancel(vo);
		System.out.println(tvo);
		return tvo;
	}
	@RequestMapping("/mypagerefund.do")
	@ResponseBody
	public String updateUser(String rsvNum){
		System.out.println("[mypageController] updateReserve 기능");
		System.out.println(rsvNum);
		int Num = Integer.parseInt(rsvNum);
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setRsvNum(Num);
		reserveservice.updateReserve(vo);
		return "success";
	}
}
