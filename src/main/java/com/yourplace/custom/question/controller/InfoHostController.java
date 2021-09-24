package com.yourplace.custom.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.custom.question.service.HostInfoService;
import com.yourplace.custom.question.vo.HostInfoVO;

@Controller
public class InfoHostController {

	@Autowired
	private HostInfoService hostInfoService;

	@GetMapping("/hostInfo.do")
	public String InfoForm(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(0);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm";
	}
	
	@GetMapping("/hostInfo1.do")
	public String InfoForm1(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(1);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm1";
	}
	
	@GetMapping("/hostInfo2.do")
	public String InfoForm2(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(2);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm2";
	}
	
	@GetMapping("/hostInfo3.do")
	public String InfoForm3(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(3);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm3";
	}
	
	@GetMapping("/hostInfo4.do")
	public String InfoForm4(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(4);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm4";
	}
	
	@GetMapping("/hostInfo5.do")
	public String InfoForm5(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(5);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm5";
	}
	
	@GetMapping("/hostInfo6.do")
	public String InfoForm6(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(6);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm6";
	}
	
	@GetMapping("/hostInfo7.do")
	public String InfoForm7(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(7);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm7";
	}
	
	@GetMapping("/hostInfo8.do")
	public String InfoForm8(Model model, HostInfoVO vo) {
		vo.setInfoHostCate(8);
		System.out.println("guestInfoForm.jsp 호출");
		List<HostInfoVO> Hostlist = hostInfoService.hostInfoView(vo);
		model.addAttribute("hostInfoList", Hostlist);
		return "question/hostInfo/hostInfoForm8";
	}
	
}

