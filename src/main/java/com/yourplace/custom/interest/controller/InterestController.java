package com.yourplace.custom.interest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.custom.interest.service.InterestService;
import com.yourplace.custom.interest.vo.InterestVO;

@Controller
public class InterestController {

	
	@Autowired
	private InterestService interestService;
	
	@GetMapping("/interest.do")
	public String interestForm(Model model, InterestVO vo) {
		System.out.println("interest.jsp 호출 ");
		vo.setPlaceNum(1);
		vo.setUserId("TEST01");
		List<InterestVO> list = interestService.interestView(vo);
		model.addAttribute("interestList", list);
		return "interest/interestForm";
	}
	
}
