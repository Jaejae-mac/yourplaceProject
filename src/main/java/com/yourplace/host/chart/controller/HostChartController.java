package com.yourplace.host.chart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.chart.service.HostChartService;
import com.yourplace.host.chart.vo.HostChartVO;

@RestController
public class HostChartController {

	@Inject
	private HostChartService service;

	public ModelAndView getYearChartView(HttpServletRequest request, HostChartVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostChartVO> list = service.getChartData(vo);

		return mav;
	}

	@RequestMapping(value = "/getYearChartForHost.hdo")
	public ModelAndView getYearChart(HttpServletRequest request, HostChartVO vo) throws Exception { // 연간 차트
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);

		List<HostChartVO> list = service.getChartData(vo);

		mav.setViewName("HostChartYear");

		List<Integer> getList = new ArrayList<Integer>();

		int countJa = 0;
		int countFe = 0;
		int countMar = 0;
		int countApr = 0;
		int countMay = 0;
		int countJun = 0;
		int countJul = 0;
		int countAug = 0;
		int countSep = 0;
		int countOct = 0;
		int countNov = 0;
		int countDec = 0;

		for (int i = 0; i < list.size(); i++) {
			String getMonth = list.get(i).getReserveMonth();

			if (getMonth.equals("1")) {
				countJa++;
			}
			if (getMonth.equals("2")) {
				countFe++;
			}

			if (getMonth.equals("3")) {
				countMar++;

			}

			if (getMonth.equals("4")) {
				countApr++;
			}

			if (getMonth.equals("5")) {
				countMay++;

			}

			if (getMonth.equals("6")) {
				countJun++;

			}

			if (getMonth.equals("7")) {
				countJul++;

			}

			if (getMonth.equals("8")) {
				countAug++;
			}

			if (getMonth.equals("9")) {
				countSep++;
			}

			if (getMonth.equals("10")) {
				countOct++;

			}

			if (getMonth.equals("11")) {
				countNov++;

			}

			if (getMonth.equals("12")) {
				countDec++;

			}

		}
			
			getList.add(countJa);
			getList.add(countFe);
			getList.add(countMar);
			getList.add(countApr);
			getList.add(countMay);
			getList.add(countJun);
			getList.add(countJul);
			getList.add(countAug);
			getList.add(countSep);
			getList.add(countOct);
			getList.add(countNov);
			getList.add(countDec);

		System.out.println(getList.toString());
		mav.addObject("data", getList);
		return mav;

	}

	@RequestMapping(value="/getInvoiceForHost.hdo") //저번달 매출이랑 비교 추가해야함
	public ModelAndView getCategoryChart(HttpServletRequest request, HostChartVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		vo.setUserId(userId);

		List<HostChartVO> list = service.getInvoiceChart(vo);
		List<Integer> su = new ArrayList<Integer>();
	
		LinkedHashMap<String, Integer> chartData = new LinkedHashMap<String, Integer>();
	
		System.out.println(list.toString());
	
	
			for (int i = 0; i <list.size(); i++) {
				int pay = list.get(i).getReserveValue();
				String payDate = list.get(i).getPayDate();
<<<<<<< HEAD

				
				
				System.out.println(pay);
				System.out.println(payDate);
	
=======
				System.out.println(pay);
				System.out.println(payDate);
>>>>>>> c80984dff030de395546c1941133e0e677692cb9
				chartData.put(payDate, pay);			
	
			}
				System.out.println(chartData);

				int value = 0;
	
				if (chartData.containsKey("1")) {
					value = chartData.get("1").intValue();
					su.add(value);
				}
				if (chartData.containsKey("2")) {
					value = chartData.get("2").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("3")) {
					value = chartData.get("3").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("4")) {
					value = chartData.get("4").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("5")) {
					value = chartData.get("5").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("6")) {
					value = chartData.get("6").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("7")) {
					value = chartData.get("7").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("8")) {
					value = chartData.get("8").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("9")) {
					value = chartData.get("9").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("10")) {
					value = chartData.get("10").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("11")) {
					value = chartData.get("11").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("12")) {
					value = chartData.get("12").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("13")) {
					value = chartData.get("13").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("14")) {
					value = chartData.get("14").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("15")) {
					value = chartData.get("15").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("16")) {
					value = chartData.get("16").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("17")) {
					value = chartData.get("17").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("18")) {
					value = chartData.get("18").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("19")) {
					value = chartData.get("19").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("20")) {
					value = chartData.get("20").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("21")) {
					value = chartData.get("21").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("22")) {
					value = chartData.get("22").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("23")) {
					value = chartData.get("23").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("24")) {
					value = chartData.get("24").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("25")) {
					value = chartData.get("25").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("26")) {
					value = chartData.get("26").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("27")) {
					value = chartData.get("27").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("28")) {
					value = chartData.get("28").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("29")) {
					value = chartData.get("29").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("30")) {
					value = chartData.get("30").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
				if (chartData.containsKey("31")) {
					value = chartData.get("31").intValue();
					su.add(value);
				}else {
					value = 0;
					su.add(value);
				}
<<<<<<< HEAD
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			
		System.out.println("su" + su.toString());
		mav.addObject("map", su);
=======

		
		System.out.println("su" + su.toString());
		mav.addObject("map", su);
		
>>>>>>> c80984dff030de395546c1941133e0e677692cb9
		mav.setViewName("HostChartInvoice");
		return mav;
	}

}