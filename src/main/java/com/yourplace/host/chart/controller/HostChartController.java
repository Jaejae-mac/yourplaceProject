package com.yourplace.host.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.chart.service.HostChartService;
import com.yourplace.host.chart.vo.HostChartVO;

@RestController
public class HostChartController {

	@Inject
	private HostChartService service;

//	@RequestMapping(value = "/getYearChartForHost.hdo")
	public ModelAndView getYearChart(HttpServletRequest request, HostChartVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostChartVO> list = service.getChartData(vo);
//		mav.setViewName("HostChartYear");
//		dataJson(request, vo);
		return mav;
	}

	@GetMapping("/getYearChartForHost.hdo")
	public ModelAndView getChart(HttpServletRequest request, HostChartVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostChartVO> list = service.getChartData(vo);
		mav.setViewName("HostChartYear");

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
//				System.out.println(getMonth);
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

		} catch (Exception e) {

		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("Jan", countJa);
		map.put("Feb", countFe);
		map.put("Mar", countMar);
		map.put("Apr", countApr);
		map.put("May", countMay);
		map.put("Jun", countJun);
		map.put("Jul", countJul);
		map.put("Aug", countAug);
		map.put("Sep", countSep);
		map.put("Oct", countOct);
		map.put("Nov", countNov);
		map.put("Dec", countDec);
		
		System.out.println(map.toString());
		mav.addObject("chartValue",map );
		
	
		return mav;
		
	}
	
	
//
//	
//@GetMapping("/getChart.hdo")
//	public void dataJson(HttpServletRequest request, HostChartVO vo) throws Exception {
//		FileWriter wr = null;
//
//		List<HostChartVO> list = service.getChartData(vo);
//		
//		JsonObject json = new JsonObject();
//		int countJa = 0;
//		int countFe = 0;
//		int countMar = 0;
//		int countApr = 0;
//		int countMay = 0;
//		int countJun = 0;
//		int countJul = 0;
//		int countAug = 0;
//		int countSep = 0;
//		int countOct = 0;
//		int countNov = 0;
//		int countDec = 0;
//	
//		
//		try {	
//				for(int i=0; i<=list.size(); i++) {
//					
//				String month = list.get(i).getReserveMonth();
////				System.out.println(month);
//
//				if (month.equals("1")) {
//						countJa ++;
//						json.addProperty("Jan", Integer.toString(countJa));	
//						
//				}
//				if (month.equals("2")) {
//					countFe++;
//					json.addProperty("Feb",Integer.toString(countFe));
//				}
//
//				if (month.equals("3")) {
//					countMar++;
//					json.addProperty("Mar",Integer.toString(countMar));
//				}
//
//				if (month.equals("4")) {
//					countApr++;
//					json.addProperty("Apr", Integer.toString(countApr));
//				}
//
//				if (month.equals("5")) {
//					countMay++;
//					json.addProperty("May",Integer.toString(countMay));
//				}
//
//				if (month.equals("6")) {
//					countJun++;
//					json.addProperty("June",Integer.toString(countJun));
//				}
//
//				if (month.equals("7")) {
//					countJul++;
//					json.addProperty("July",Integer.toString(countJul));
//				}
//
//				if (month.equals("8")) {
//					countAug++;
//					json.addProperty("Aug", Integer.toString(countAug));
//				}
//
//				if (month.equals("9")) {
//					countSep++;
//					json.addProperty("Sep", Integer.toString(countSep));
//				}
//
//				if (month.equals("10")) {
//					countOct++;
//					json.addProperty("Oct",Integer.toString(countOct));
//				}
//
//				if (month.equals("11")) {
//					countNov++;
//					json.addProperty("Nov", Integer.toString(countNov));
//				}
//
//				if (month.equals("12")) {
//					countDec++;
//					json.addProperty("Dec", Integer.toString(countDec));
//				}
//
//				JsonArray arr = new JsonArray();
//				arr.add(json);
//
//				Gson gson = new GsonBuilder().setPrettyPrinting().create();
//				String j = gson.toJson(json);
//				}
//
//		
//		}catch(Exception e) {
//			
//		}
//}

}