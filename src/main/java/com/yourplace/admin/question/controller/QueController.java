package com.yourplace.admin.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.admin.question.service.QuestionService;
import com.yourplace.admin.question.vo.QuestionVO;

@Controller
public class QueController {

	@Autowired
	private QuestionService queService;
	
	@GetMapping(value="/questionView.mdo")
	public void queView(Model model)
	{
		System.out.println("문의사항 리스트 호출");
		List<QuestionVO> list = queService.getQue();
		model.addAttribute("queList", list);
	}
	
}
