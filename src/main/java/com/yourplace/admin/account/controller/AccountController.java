package com.yourplace.admin.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yourplace.admin.account.service.AccountListService;
import com.yourplace.admin.account.service.InsertAccountService;
import com.yourplace.admin.account.vo.AccountVO;

@Controller
public class AccountController {

	@Autowired
	private AccountListService accountList;
	
	@Autowired
	private InsertAccountService insertAdmin;
	
	
	//모든 admin 조회.
	@GetMapping(value="/rootAccountView.mdo")
	public void accountListView(Model model)
	{
		System.out.println("[Controller] Admin List View 호출");
		List<AccountVO> list = accountList.getAccountList();
		model.addAttribute("adminList", list);
	}
	
	
	//modal 로 띄운 admin 추가 기능 수행
	@PostMapping(value="/adminRegist.mdo")
	public String accountRegist(HttpServletRequest request)
	{
		System.out.println("[Controller] Admin Regist 호출");
		
		AccountVO vo = new AccountVO();
		
		//View 에서 입력된 정보값 가져옴
		
		String author = request.getParameter("adminAuthority"); //string 으로 받아서 
		int authority = Integer.parseInt(author); // int로 형변환
		
		String id = request.getParameter("adminId");
		String pw = request.getParameter("adminPw");
		String name = request.getParameter("adminName");
		String email = request.getParameter("adminEmail");
		String tel = request.getParameter("adminTel");
		
		//vo 객체에 세팅
		vo.setAdminAuthority(authority);
		vo.setAdminId(id);
		vo.setAdminPw(pw);
		vo.setAdminName(name);
		vo.setAdminEmail(email);
		vo.setAdminTel(tel);
		
		//service 수행
		insertAdmin.insertAccount(vo);
		
		return "redirect:rootAccountView.mdo";
	}
	
}
