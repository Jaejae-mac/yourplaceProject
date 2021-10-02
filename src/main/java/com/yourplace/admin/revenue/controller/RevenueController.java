package com.yourplace.admin.revenue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.admin.revenue.service.RevenueCntService;
import com.yourplace.admin.revenue.service.RevenueMonthService;
import com.yourplace.admin.revenue.service.RevenueTermService;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Controller
public class RevenueController {
	
	@Autowired
	private RevenueMonthService revenueMonthService;
	
	@Autowired
	private RevenueCntService revenueCntService;
	
	@Autowired
	private RevenueTermService revenueTermService;
	
	
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
		
		System.out.println("FirstList 출력" + list1.toString());
		
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
	
	
	@GetMapping(value="/specificRevenue.mdo")
	public String getValuesForm()
	{

		return "specificRevenue";
	}
	
	
	@PostMapping(value="/specificRevenue.mdo")
	public void postValueForm(Model model, HttpServletRequest request, RevenueVO vo)
	{
		System.out.println("[Controller] POST - 입력된 날짜로 조회");
		
		//입력된 값 받아오기
		String year = request.getParameter("thisyear");
		String startMonth = request.getParameter("StartMonth");
		String endMonth = request.getParameter("EndMonth");
		String startDate = request.getParameter("StartDate");
		String endDate = request.getParameter("EndDate");
		
		System.out.println("입력받은 값 출력 : " + year + startMonth + endMonth + startDate + endDate);
		
//		//입력된 String 을 int로 변환
		int iYear = Integer.parseInt(year);
//		int iStartMonth = Integer.parseInt(startMonth);
//		int iEndMonth = Integer.parseInt(endMonth);
//		int iStartDate = Integer.parseInt(startDate);
//		int iEndDate = Integer.parseInt(endDate);
		
//		System.out.println("int 변환 후 값 출력 : " + iYear + iStartMonth + iEndMonth + iStartDate + iEndDate);
		
		//vo에 setting
		vo.setPayYear(iYear);
		vo.setPayStartMonth(startMonth);
		vo.setPayEndMonth(endMonth);
		vo.setPayStartDate(startDate);
		vo.setPayEndDate(endDate);
		
		List<RevenueVO> list1 = revenueTermService.getTermMonth(vo);
		List<RevenueVO> list2 = revenueTermService.getTermMonthNDate(vo);
		List<RevenueVO> list3 = revenueTermService.getTermAllMonth(vo);
		List<RevenueVO> list4 = revenueTermService.getTermAllMonthNDate(vo);
		
		System.out.println("출력되는 LIST: " + list4.toString());
		model.addAttribute("requestList", list4);
		
		//return "redirect:specificRevenue.mdo";
	}
	
	

	
}
