package com.yourplace.admin.revenue.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.admin.revenue.service.RevenueCntService;
import com.yourplace.admin.revenue.service.RevenueMonthService;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Controller
public class RevenueController {
	
	@Autowired
	private RevenueMonthService revenueMonthService;
	
	@Autowired
	private RevenueCntService revenueCntService;
	
	
	@GetMapping(value="/revenueView.mdo")
	public String viewForm(Model model)
	{
		int thisYear = 2021;
		int lastYear = 2020;
		
		System.out.println("[Controller] Chart page 호출");
		
		//월별 실제매출 관련
		List<RevenueVO> list1 = revenueMonthService.getMonthSumFirst(lastYear);
		List<RevenueVO> list2 = revenueMonthService.getMonthSumFirst(thisYear);
		List<Double> list3 = revenueMonthService.getMoM(2021);
		
		model.addAttribute("FirstList", list1); // 2020 월별
		model.addAttribute("SecondList", list2); // 2021 월별
		model.addAttribute("MoMList", list3); // 2021 월대비
		
		//월별 예약건수 관련
//		List<RevenueVO> list4 = revenueCntService.getRsvCountFirst(lastYear);
//		List<RevenueVO> list5 = revenueCntService.getRsvCountFirst(thisYear);
		List<RevenueVO> list6 = revenueCntService.getMainCateRank(thisYear);
//		List<RevenueVO> list7 = revenueCntService.getSubCateRank(thisYear);
		
//		model.addAttribute("RsvCountLast", list4);
//		model.addAttribute("RsvCountThis", list5);
		model.addAttribute("MainCateRank", list6);
//		model.addAttribute("SubCateRank", list7);
 		
		return "revenueView";
	}
	
	

	
}
