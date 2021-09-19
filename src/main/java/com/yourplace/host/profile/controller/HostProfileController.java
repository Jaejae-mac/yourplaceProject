package com.yourplace.host.profile.controller;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

=======
>>>>>>> 048c1b2f8ce36b365d8039112f0f3e58c6ee13f1
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

<<<<<<< HEAD
import com.yourplace.host.login.vo.HostVO;

=======
>>>>>>> 048c1b2f8ce36b365d8039112f0f3e58c6ee13f1
@Controller
public class HostProfileController {
	
	@RequestMapping(value="/updateProfileforHost.hdo")
<<<<<<< HEAD
	public ModelAndView hostProfile(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String hostnick = (String)session.getAttribute("userNickName");
		String hostIntro = (String)session.getAttribute("userIntro");
		System.out.println(hostnick);
		System.out.println(hostIntro);
		mav.setViewName("updateProfileforHost");
		mav.addObject("hostNick", hostnick); //닉네임
		mav.addObject("hostIntro", hostIntro); //자기소개
		
=======
	public ModelAndView hostProfile() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateProfileforHost");
>>>>>>> 048c1b2f8ce36b365d8039112f0f3e58c6ee13f1
		return mav;
	}
	

}
