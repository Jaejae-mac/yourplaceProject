package com.yourplace.admin.login.controller;

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

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private LoginAdminService loginService;
	
	@GetMapping("/login.mdo")
	public String loginForm()
	{
		System.out.println("로그인 페이지 호출");
		return "login";
	}
	
	
	@PostMapping("/login.mdo")
	public String login(AdminVO vo, HttpServletRequest request, Model model)
	{
		int result = loginService.loginAdmin(vo);
		if (result == 1) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("AdminId", vo.getAdminId());
			session.setAttribute("AdminNum", vo.getAdminNum());

			// 로그인 성공시에는 return의 홈페이지로 이동시켜준다.
			return "index";
		}
		model.addAttribute("result", "0");
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
