package com.yourplace.host.chart.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

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
	public ModelAndView getYearChart(HttpServletRequest request, HostChartVO vo) throws Exception { //연간 차트
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);

		List<HostChartVO> list = service.getChartData(vo);
		System.out.println(list.toString());
		
		mav.setViewName("HostChartYear");

	LinkedHashMap<String, Object> map =new LinkedHashMap<String, Object>();
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

		try {
			for (int i = 0; i <= list.size(); i++) {
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
				
				map.put("Jan", countJa);
				map.put("Feb", countFe);
				map.put("Mar", countMar);
				map.put("Apr", countApr);
				map.put("May", countMay);
				map.put("Jun", countJun);
				map.put("Jul", countJul);
				map.put("Aug", countAug);
				map.put("Sep", countSep);

				mav.addObject("data", map);
				System.out.println(map.toString());
			}

		} catch (Exception e) {

		}

		return mav;

	}

	@RequestMapping(value="/getInvoiceForHost.hdo") //저번달 매출이랑 비교 추가해야함
	public ModelAndView getCategoryChart(HttpServletRequest request, HostChartVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);

		List<HostChartVO> list = service.getChartData(vo);
		List<Integer> paylist = new ArrayList<Integer>();
	
		try {
			for(int i=0; i<=list.size(); i++) {
				int getAfterTax = Integer.parseInt(list.get(i).getAfterTax());
				paylist.add(getAfterTax);
				}
					
			
		}catch(Exception e) {
			
		}

			int sum = paylist.stream().mapToInt(Integer::intValue).sum();

		System.out.println(sum);
		System.out.println(paylist);

		mav.addObject("map", sum);
		mav.setViewName("HostChartInvoice");
		return mav;
	}
}