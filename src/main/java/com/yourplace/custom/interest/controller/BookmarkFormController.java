package com.yourplace.custom.interest.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.custom.interest.service.BookmarkListService;
import com.yourplace.custom.interest.vo.InterestVO;
import com.yourplace.custom.login.vo.UserVO;

@Controller
public class BookmarkFormController {
	
	@Autowired
	private BookmarkListService bookmarkListService;
	
	@GetMapping("/interest.do")
	public String interestForm(HttpSession session, Model model) {
		String userId = ((UserVO)(session.getAttribute("userVO"))).getUserId();
		InterestVO vo = new InterestVO();
		vo.setUserId(userId);
		List<InterestVO> list = bookmarkListService.bookmarkList(vo);
		model.addAttribute("interestList", list);
		
		return "interest/interestForm";
	}
	
}
