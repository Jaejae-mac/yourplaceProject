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
	
	@GetMapping("/login.mdo")
	public String loginForm()
	{
		System.out.println("로그인 페이지 호출");
		return "login";
	}
	
	@PostMapping("/login.mdo")
	public String login(AdminVO vo, HttpServletRequest request, Model model)
	{
		AdminVO login = loginService.loginAdmin(vo);
		if (login.getLoginSuccess() == 1) {
			
			HttpSession session = request.getSession(); //세션 생성
			
			session.setAttribute("AdminId", login);
			session.setAttribute("AdminNum", login.getAdminNum());
			session.setAttribute("AdminAuthority", login.getAdminAuthority());
			
			// 로그인 성공시에는 return의 홈페이지로 이동시켜준다.
			return "index-admin";
		}
		
		model.addAttribute("login", "0");
		return "redirect:login.mdo";
		
	}
	
	
	//Index-admin
	
	@GetMapping("/index-admin.mdo")
	public String directIndex(HttpServletRequest request, Model model)
	{
		System.out.println("[Controller] index-admin 으로 직접 접근");
		return "login";
	} 
	
	@PostMapping(value="/index-admin.mdo")
	public String viewForm(Model model)
	{
		//매출 조회 시작
		int thisYear = 2021;
		int lastYear = 2020;
		
		System.out.println("[Controller] index page 의 Chart 호출");
		
		//월대비 매출 관련
		List<Double> list1 = revenueMonthService.getMoM(thisYear);
		model.addAttribute("MoMList", list1); // 2021 월대비

		//인기 카테고리
		List<RevenueVO> list2 = revenueCntService.getMainCateRank(thisYear); // 메인
//		List<RevenueVO> list3 = revenueCntService.getSubCateRank(thisYear); // 서브
		model.addAttribute("MainCateRank", list2);
//		model.addAttribute("SubCateRank", list3);
		
		/////////Table
		
		//승인 대기중인 테이블 조회
		
		List<SpaceVO> list4 = spaceList.beforeAllow();
		model.addAttribute("AllowList", list4);
		
		return "index-admin";
	}
	

	
//	@RequestMapping("/login.mdo")
//	public void test() {
//		AdminVO vo = new AdminVO();
//		
//		vo.setAdminId("");
//		vo.setAdminPw("");
//		AdminVO admin = adminService.getAdmin(vo);
//		System.out.println(admin.toString());
//		
//	}
}
