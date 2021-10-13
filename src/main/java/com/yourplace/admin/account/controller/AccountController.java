package com.yourplace.admin.account.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.account.service.AccountListService;
import com.yourplace.admin.account.service.DeleteAccountService;
import com.yourplace.admin.account.service.InsertAccountService;
import com.yourplace.admin.account.vo.AccountVO;

@Controller
public class AccountController {

	@Autowired
	private AccountListService accountList;
	
	@Autowired
	private InsertAccountService insertAdmin;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private DeleteAccountService deleteAdmin;
	
	//모든 admin 조회.
	@GetMapping(value="/rootAccountView.mdo")
	public void accountListView(Model model, HttpServletRequest request)
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
		
		//pw 인코딩
		String encryptPw = passEncoder.encode(pw);
		
		//vo 객체에 세팅
		vo.setAdminAuthority(authority);
		vo.setAdminId(id);
		vo.setAdminPw(encryptPw);
		vo.setAdminName(name);
		vo.setAdminEmail(email);
		vo.setAdminTel(tel);
		
		//service 수행
		insertAdmin.insertAccount(vo);
		
		return "redirect:rootAccountView.mdo";
	}
	
	@PostMapping(value="/deleteAdmin.mdo")
	public String deleteAccount(@RequestParam("deleteAdmin") String num)
	{
		System.out.println("[Controller] Delete Admin 기능 수행");
		
		int adminNum = Integer.parseInt(num);
		deleteAdmin.deleteAdmin(adminNum);
		
		return "redirect:rootAccountView.mdo";
	}
	
}
