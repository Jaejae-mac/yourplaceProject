package com.yourplace.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yourplace.admin.login.dao.AdminDAO;
import com.yourplace.admin.login.vo.AdminVO;

@Service("loginService")
public class LoginAdminServiceImpl implements LoginAdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Override
	public AdminVO loginAdmin(AdminVO vo){
		
		System.out.println("-----------------");
		System.out.println("Login Service");
		AdminVO adminVO = adminDAO.getIdPw(vo);
		
		System.out.println("-----------------");
		
		//인코딩된 번호와 같으면
		if (passEncoder.matches(vo.getAdminPw(), adminVO.getAdminPw()))
		{
			System.out.println("ID PW 일치 - 로그인 가능");
			System.out.println("Login Status Changed to 1");
			System.out.println("-----------------");
			
			adminVO.setLoginSuccess(1);
			
			return adminVO;
			
		}
//		//또는 그냥 번호와 같으면
//		else if (vo.getAdminPw() == adminVO.getAdminPw())
//		{
//			System.out.println("ID PW 일치 - 로그인 가능");
//			System.out.println("Login Status Changed to 1");
//			System.out.println("-----------------");
//			
//			return 1;
//		}
		
		else
		{
			System.out.println("ID PW 불일치 - 로그인 불가능");
			System.out.println("Login Status Changed to 0");
			System.out.println("-----------------");
			
			adminVO.setLoginSuccess(0);
			
			return adminVO;
		}
		
	}

}
