package com.yourplace.custom.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yourplace.custom.mypage.service.MyPageReserveService;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;

@Controller
public class MyPageReserveController {
	@Autowired
	private MyPageReserveService reserveservice;
	@RequestMapping("/goreserve.do")
	public String getReserveList(HttpServletRequest request, Model model) {
		System.out.println("[controller getReserveList 기능 수행]");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
//		MyPageReserveVO vo = new MyPageReserveVO();
//		vo.setRsvId(userId);;
//		System.out.println(vo.toString());
//		model.addAttribute("reserveList",reserveservice.getMyReserveList(vo) );
//		System.out.println(model);
		return "mypage/mypagereserve";
	}
}
