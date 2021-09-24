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
	public int loginAdmin(AdminVO vo) {
		
		System.out.println("-----------------");
		System.out.println("Login Service");
		AdminVO adminVO = adminDAO.getIdPw(vo);
		
		System.out.println("-----------------");
		
		if(passEncoder.matches(vo.getAdminPw(), adminVO.getAdminPw())) {
			System.out.println("ID PW 일치 - 로그인 가능");
			System.out.println("Login Status Changed to 1");
			System.out.println("-----------------");
			
			return 1;
			
		}else {
			System.out.println("ID PW 일치 - 로그인 불가능");
			System.out.println("Login Status Changed to 0");
			System.out.println("-----------------");
			
			return 0;
			
		}
		
	}

}
