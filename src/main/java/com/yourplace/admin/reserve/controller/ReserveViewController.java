package com.yourplace.admin.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.admin.reserve.service.ReserveViewService;
import com.yourplace.admin.reserve.vo.ReserveVO;

@Controller
public class ReserveViewController {

	@Autowired
	private ReserveViewService reserveViewService; 
	
	@GetMapping(value="/reserveView.mdo")
	public void reserveViewForm(Model model)
	{
		System.out.println("예약조회 뷰 호출");
		List<ReserveVO> list = reserveViewService.getReserve();
		model.addAttribute("reserveList", list);
	}
	
}
