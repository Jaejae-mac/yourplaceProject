package com.yourplace.admin.faq.guest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.faq.guest.service.DeleteFaqGuestService;
import com.yourplace.admin.faq.guest.service.FaqGuestService;
import com.yourplace.admin.faq.guest.service.InsertFaqGuestService;
import com.yourplace.admin.faq.guest.vo.FaqGuestVO;

@Controller
public class FaqGuestController {
	
	@Autowired
	private FaqGuestService infoGuestService;
	
	@Autowired
	private DeleteFaqGuestService deleteInfoService;
	
	@Autowired
	private InsertFaqGuestService insertInfoService;

	//공지사항 호출
	@GetMapping(value="/infoGuest.mdo")
	public void infoGuestView(Model model, FaqGuestVO vo)
	{
		System.out.println("게스트 공지사항 view 호출");
		List<FaqGuestVO> list = infoGuestService.getFaqList();
		model.addAttribute("infoGuestList", list);
	}
	
	//공지사항 삭제
	@PostMapping(value="/deleteInfoGue.mdo")
	public String deleteInfo(@RequestParam("deleteInfoTitle") String deleteInfoTitle)
	{
		System.out.println("-----삭제할 공지사항 타이틀 조회-----");
		System.out.println("Parameter Value: " + deleteInfoTitle);
		deleteInfoService.deleteInfoGuest(deleteInfoTitle);
		return "redirect:infoGuest.mdo";
	}
	
	//공지사항 추가등록 View 호출
	@GetMapping(value="/infoGuestRegist.mdo")
	public String registInfoForm()
	{
		return "infoGuestRegist";
	}
	
	//공지사항 추가등록 진행
	@PostMapping(value="/infoGuestRegist.mdo")
	public String registInfo(FaqGuestVO vo)
	{
		insertInfoService.insertInfo(vo);
		System.out.println("공지사항 등록 완료: " + vo.toString());
		return "redirect:infoGuest.mdo";
	}
	
}
