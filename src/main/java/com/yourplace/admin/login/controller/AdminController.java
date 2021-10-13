package com.yourplace.admin.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yourplace.admin.login.service.AdminService;
import com.yourplace.admin.login.service.LoginAdminService;
import com.yourplace.admin.login.vo.AdminVO;
import com.yourplace.admin.revenue.service.RevenueCntService;
import com.yourplace.admin.revenue.service.RevenueMonthService;
import com.yourplace.admin.revenue.vo.RevenueVO;
import com.yourplace.admin.space.service.SpaceListService;
import com.yourplace.admin.space.vo.SpaceVO;

@Controller
public class AdminController {
	
	@Autowired
	private LoginAdminService loginService;
	
	@Autowired
	private RevenueMonthService revenueMonthService;
	
	@Autowired
	private RevenueCntService revenueCntService;
	
	@Autowired
	private SpaceListService spaceList;
	
	//Login
	
	@GetMapping("/main.mdo")
	public String loginForm()
	{
		System.out.println("로그인 페이지 호출");
		return "main";
	}
	
	@PostMapping("/login.mdo")
	public String login(AdminVO vo, HttpServletRequest request, Model model,RedirectAttributes redirect)
	{
		AdminVO login = loginService.loginAdmin(vo);
		if (login.getLoginSuccess() == 1) {
			
			HttpSession session = request.getSession(); //세션 생성
			
			session.setAttribute("adminVO", vo);
			session.setAttribute("adminId", vo.getAdminId());
			session.setAttribute("AdminNum", vo.getAdminNum());
			session.setAttribute("AdminAuthority", vo.getAdminAuthority());
			redirect.addAttribute("adminId", login.getAdminId());
			redirect.addAttribute("adminAuthority", login.getAdminAuthority());
			
			// 로그인 성공시에는 return의 홈페이지로 이동시켜준다.
			return "redirect:index-admin.mdo";
		}
		
		model.addAttribute("login", "0");
		return "redirect:main.mdo";
		
	}
	
	@GetMapping(value="/home.mdo")
	public String homeClick()
	{
		return "redirect:index-admin.mdo";
	}
	
	@GetMapping(value="/index-admin.mdo")
	public void viewForm(HttpServletRequest request, Model model, AdminVO vo)
	{	
		//월대비 매출 관련
		List<Double> list1 = revenueMonthService.getMoM(2021);
		model.addAttribute("MoMList", list1); // 2021 월대비

		//인기 카테고리
		List<RevenueVO> list2 = revenueCntService.getMainCateRank(2021); // 메인
		model.addAttribute("MainCateRank", list2);
		
		//인기장소
		List<RevenueVO> list5 = revenueCntService.indexTable();
		model.addAttribute("PlaceRank", list5);
		
		//월별
		List<RevenueVO> list3 = revenueMonthService.indexChart();
		System.out.println(list3.toString());
		model.addAttribute("FirstList", list3);
		
		/////////Table			
		//승인 대기중인 테이블 조회
		List<SpaceVO> list4 = spaceList.beforeAllow();
		model.addAttribute("AllowList", list4);
		
	}
	
	//로그아웃
	@GetMapping("/adminLogout.mdo")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("AdminId") +"님이 로그아웃");
		session.invalidate();
		return "redirect:main.mdo";
	}
	
}
