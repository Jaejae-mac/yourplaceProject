package com.yourplace.custom.question.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping("/quesForm.do")
	public String quesForm() {
		return "question/guestQuesForm";
	}
	
	//1:1 문의등록 처리 메서드  INSERT
	@PostMapping("/guestques.do")
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
	@PostMapping("/guestreport.do")
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
