package com.yourplace.admin.faq.host.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.faq.host.service.DeleteFaqHostService;
import com.yourplace.admin.faq.host.service.FaqHostService;
import com.yourplace.admin.faq.host.service.InsertFaqHostService;
import com.yourplace.admin.faq.host.vo.FaqHostVO;

@Controller
public class FaqHostController {

	@Autowired
	private FaqHostService infoHostService;
	
	@Autowired
	private DeleteFaqHostService deleteHostInfoService;
	
	@Autowired
	private InsertFaqHostService insertHostInfoService;

	//공지사항 호출
	@GetMapping(value="/infoHost.mdo")
	public void infoHostView(Model model, FaqHostVO vo)
	{
		System.out.println("게스트 공지사항 view 호출");
		List<FaqHostVO> list = infoHostService.getFaqList();
		model.addAttribute("infoHostList", list);
	}
	
	//공지사항 삭제
	@PostMapping(value="/deleteInfoHost.mdo")
	public String deleteInfo(@RequestParam("deleteInfoTitle") String deleteInfoTitle)
	{
		System.out.println("-----삭제할 공지사항 타이틀 조회-----");
		System.out.println("Parameter Value: " + deleteInfoTitle);
		deleteHostInfoService.deleteInfoHost(deleteInfoTitle);
		return "redirect:infoHost.mdo";
	}
	
	//공지사항 추가등록 View 호출
	@GetMapping(value="/infoHostRegist.mdo")
	public String registInfoForm()
	{
		return "infoHostRegist";
	}
	
	//공지사항 추가등록 진행
	@PostMapping(value="/infoHostRegist.mdo")
	public String registInfo(FaqHostVO vo)
	{
		insertHostInfoService.insertInfo(vo);
		System.out.println("공지사항 등록 완료: " + vo.toString());
		return "redirect:infoHost.mdo";
	}
	
}
