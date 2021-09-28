package com.yourplace.custom.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.custom.question.service.GuestInfoService;
import com.yourplace.custom.question.vo.GuestInfoVO;

@Controller
public class InfoController {

	@Autowired
	private GuestInfoService guestInfoService;

	//각각 카테고리를 다른 form으로 처리 하였습니다 .
	@GetMapping("/guestInfo.do")
	public String InfoForm(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(0);
		System.out.println("guestInfoForm.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm";
	}

	@GetMapping("/guestInfo1.do")
	public String InfoForm1(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(1);
		System.out.println("guestInfoForm1.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm1";
	}

	@GetMapping("/guestInfo2.do")
	public String InfoForm2(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(2);
		System.out.println("guestInfoForm2.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm2";
	}

	@GetMapping("/guestInfo3.do")
	public String InfoForm3(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(3);
		System.out.println("guestInfoForm3.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm3";
	}

	@GetMapping("/guestInfo4.do")
	public String InfoForm4(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(4);
		System.out.println("guestInfoForm4.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm4";
	}

	@GetMapping("/guestInfo5.do")
	public String InfoForm5(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(5);
		System.out.println("guestInfoForm5.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm5";
	}

	@GetMapping("/guestInfo6.do")
	public String InfoForm6(Model model, GuestInfoVO vo) {
		vo.setInfoGueCate(6);
		System.out.println("guestInfoForm6.jsp 호출");
		List<GuestInfoVO> Guestlist = guestInfoService.guestInfoView(vo);
		model.addAttribute("guestInfoList", Guestlist);
		return "question/guestInfo/guestInfoForm6";
	}

}
