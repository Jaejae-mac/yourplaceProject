package com.yourplace.custom.question.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.question.service.QuestionService;
import com.yourplace.custom.question.service.ReportService;
import com.yourplace.custom.question.vo.QuestionVO;
import com.yourplace.custom.reserve.vo.ReserveVO;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/quesForm.do")
	public String quesForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", questionService.getUser(vo));
		return "question/guestQuesForm";
	}
	
	//1:1 문의등록 처리 메서드  INSERT
	@RequestMapping("/guestques.do")
	public String guestQues(QuestionVO vo, HttpServletRequest request) {
		System.out.println("[QuestionController] 1:1문의 등록하기");
		System.out.println(vo.toString());
		HttpSession session = request.getSession();
		session.setAttribute("reprtContent", vo.getReprtContent());
		questionService.insertQues(vo);
		System.out.println("[QuestionController] insertQues");
		
		return "redirect:quesForm.do"; 
	}
	
	//신고하기 문의 등록 처리 메서드 INSERT
	@RequestMapping("/guestreport.do")
	public String guestReport(QuestionVO vo, HttpServletRequest request) {
		System.out.println("[QuestionController] 신고하기 등록하기");
		System.out.println(vo.toString());
		HttpSession session2 = request.getSession();
		session2.setAttribute("rsvNum", vo.getRsvNum());
		session2.setAttribute("reprtContent", vo.getReprtContent());
		reportService.insertReport(vo);
		
		return "redirect:quesForm.do";
	}
}
