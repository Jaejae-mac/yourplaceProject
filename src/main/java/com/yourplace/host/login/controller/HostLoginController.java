package com.yourplace.host.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.login.service.HostLoginService;
import com.yourplace.host.login.vo.HostVO;

@Controller
public class HostLoginController {
	@Autowired
	private HostLoginService service;
	// 로그인 폼을 호출해주는 컨트롤러.

	@GetMapping("/loginForm.hdo")
	public String loginForm() {
		System.out.println("[ 호스트 로그인 폼 호출 ]");
		return "login/loginForm";
	}
	//지금 스프링 시큐리티때문에 passencoder로 대조 못하면 에러남 

	@PostMapping("/login.hdo")
	public String login(HostVO vo, Model model, HttpServletRequest request) throws Exception {
		int result = service.getHostLogin(vo);
		if(result == 1) {
			//로그인 성공시에는세션을 생성해준다.
			HttpSession session = request.getSession();
			//세션의 키로 userId 를 주고 세션의 값으로 유저의 아이디를 준다.
			session.setAttribute("userId", vo.getUserId());
			//로그인 성공시에는 호스트의 홈페이지로 이동시켜준다.
			getHostInfo(request, vo);
			return "redirect:indexOurPlace.hdo";
			
		}
		model.addAttribute("result", "0");
		

		return "redirect:loginForm.do";
		
	}
	
	public void getHostInfo(HttpServletRequest request, HostVO vo) throws Exception{
		List<HostVO> list = service.getHostInfo(vo);
		System.out.println(list.toString());
		
		
		try {
			for(int i=0; i<=list.size(); i++) {
				String sex = list.get(i).getUserSex();
				String nick = list.get(i).getUserNickName();
				String info = list.get(i).getUserIntro();
				
				HttpSession session = request.getSession();
				session.setAttribute("userSex", sex);
				session.setAttribute("userNick", nick);
				session.setAttribute("userInfo", info);
				
				String sid = (String) session.getAttribute("userId");
				String ssex =(String) session.getAttribute("userSex");
				String snick = (String) session.getAttribute("userNick");
				String sinfo=(String)session.getAttribute("userInfo");
				
				System.out.println(sid);
				System.out.println(snick);
				System.out.println(sinfo);
				
				
			}
		}catch(Exception e) {
			
		}
		
		
		
		
	}
	
	@RequestMapping(value="/updateProfile.hdo", method=RequestMethod.POST) //변경되는거 확인
	public String updateProfile(HostVO vo, HttpServletRequest request) throws Exception{
		String testId = request.getParameter("userId");
		String testnick = request.getParameter("name");
		String testintro = request.getParameter("intro");
		
		System.out.println(testId);
		System.out.println(testnick);
		System.out.println(testintro);
		vo.setUserId(testId);
		vo.setUserNickName(testnick);
		vo.setUserIntro(testintro);
		HttpSession session = request.getSession();
		
		
		service.updateProfile(vo);
		session.setAttribute("userNick", testnick);
		session.setAttribute("userInfo", testintro);
		return "redirect:updateProfileforHost.hdo";
	}
}