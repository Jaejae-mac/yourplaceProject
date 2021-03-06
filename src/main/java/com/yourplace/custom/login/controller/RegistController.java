package com.yourplace.custom.login.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yourplace.commons.coolsms.SMSCertification;
import com.yourplace.custom.login.service.IdCheckService;
import com.yourplace.custom.login.service.InsertCouponService;
import com.yourplace.custom.login.service.LoginUserService;
import com.yourplace.custom.login.service.RegistService;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.reservation.vo.CouponVO;

//회원가입관련 요청과 응답을 처리할 컨트롤러.
@Controller
public class RegistController {
	
	//아이디 중복체크 서비스.
	@Autowired
	private IdCheckService idCheckService;
	//회원가입 서비스.
	@Autowired
	private RegistService registService;
	@Autowired
	private LoginUserService loginUserService;
	@Autowired
	private InsertCouponService insertCouponService;
	//회원 가입 모듈로 보내주는 메서드.
	@GetMapping("/register.do")
	public String registerForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("userType", 0);
		return "login/registerForm";
	}
	@GetMapping("/Hostregister.do")
	public String registerFormH(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("userType", 1);
		return "login/registerForm";
	}
	
	//아이디 중복 체크 메서드.
	@PostMapping("/idcheck.do")
	@ResponseBody
	public String idCheck(String id) {
		UserVO vo = new UserVO();
		vo.setUserId(id);
		String result = idCheckService.idCheck(vo);
		return result;
	}
	
	//번호 인증 처리 메서드.
	//비동기로 전화번호 인증을 처리해준다.
	@GetMapping("/authentication.do")
	@ResponseBody
	public String authNum(String userTel) {//전화번호 확인 메서드.
		String phoneNumber= userTel;
		Random rand = new Random();
		String numStr = "";
		//랜덤하게 생성된 6자리의 인증번호를 만든다.
		for(int i = 0 ; i < 6; i++) {
			String randNum = Integer.toString(rand.nextInt(10));
			numStr += randNum;
		}
		System.out.println("[RegistController] 생성된 6자리 인증번호 : "+ numStr);
		//certificationPhoneNumber 메서드를 통해 사용자번호로 생성된 인증번호를 전송한다.
		SMSCertification.certificationPhoneNumber(phoneNumber, numStr);
		//사용자에게 문자메세지 전송후, view에도 동일한 인증번호를 전달한다.
		return numStr;
	}
	
	//회원가입 처리 메서드.(INSERT)
	@PostMapping("/regist.do")
	public String regist(UserVO vo, HttpServletRequest request, RedirectAttributes redirect) {
		//제대로된 아이디와 비밀번호 가 전송되었을 경우.
		if(vo.getUserId().length() > 0 && vo.getUserPw().length() > 0) {
			if(vo.getUserType() == 0) {
				CouponVO welcomeCoupon = new CouponVO();
				welcomeCoupon.setUserCoupId(vo.getUserId());
				//회원정보를 멤버테이블에 등록.
				registService.insertUser(vo);
				//가입환영 쿠폰을 넣어준다.
				insertCouponService.welcomeCoupon(welcomeCoupon);
				UserVO userVO = loginUserService.getUser(vo);
				//회원가입 완료후 아이디 세션 생성.
				HttpSession session = request.getSession();
				redirect.addAttribute("welcomeCoupon", "welcomeCoupon");
				session.setAttribute("userId", userVO.getUserId());
				session.setAttribute("userVO", userVO);
				return "redirect:home.do";
			}else {
				registService.insertUser(vo);
				return "redirect:loginForm.hdo";
			}
		}
		
		//회원가입후 홈으로 보내주고, 쿠폰을 발급해 주어야 한다. - 미구현.
		return "redirect:home.do";
	}	
}

