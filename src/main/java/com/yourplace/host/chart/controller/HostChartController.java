package com.yourplace.host.chart.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.yourplace.host.chart.service.HostChartService;
import com.yourplace.host.chart.vo.HostChartVO;

@RestController
public class HostChartController {

	@Inject
	private HostChartService service;

	@RequestMapping(value = "/getYearChartForHost.hdo")
	public ModelAndView getYearChart(HttpServletRequest request, HostChartVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		List<HostChartVO> list = service.getChartData(vo);
		mav.setViewName("HostChartYear");
		dataJson(request, vo);
		return mav;
	}
	
	
	@RequestMapping(value="/refund.hdo")
	public ModelAndView refund() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RefundModule");
		return mav;
	}
	
	
@GetMapping("/getChart.hdo")
	public void dataJson(HttpServletRequest request, HostChartVO vo) throws Exception {
		FileWriter wr = null;

		List<HostChartVO> list = service.getChartData(vo);
		JsonObject json = new JsonObject();
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
				for(int i=0; i<=list.size(); i++) {
					
				String month = list.get(i).getReserveMonth();
//				System.out.println(month);

				if (month.equals("1")) {
						countJa ++;
						json.addProperty("Jan", Integer.toString(countJa));	
						
				}
				if (month.equals("2")) {
					countFe++;
					json.addProperty("Feb",Integer.toString(countFe));
				}

				if (month.equals("3")) {
					countMar++;
					json.addProperty("Mar",Integer.toString(countMar));
				}

				if (month.equals("4")) {
					countApr++;
					json.addProperty("Apr", Integer.toString(countApr));
				}

				if (month.equals("5")) {
					countMay++;
					json.addProperty("May",Integer.toString(countMay));
				}

				if (month.equals("6")) {
					countJun++;
					json.addProperty("June",Integer.toString(countJun));
				}

				if (month.equals("7")) {
					countJul++;
					json.addProperty("July",Integer.toString(countJul));
				}

				if (month.equals("8")) {
					countAug++;
					json.addProperty("Aug", Integer.toString(countAug));
				}

				if (month.equals("9")) {
					countSep++;
					json.addProperty("Sep", Integer.toString(countSep));
				}

				if (month.equals("10")) {
					countOct++;
					json.addProperty("Oct",Integer.toString(countOct));
				}

				if (month.equals("11")) {
					countNov++;
					json.addProperty("Nov", Integer.toString(countNov));
				}

				if (month.equals("12")) {
					countDec++;
					json.addProperty("Dec", Integer.toString(countDec));
				}

				JsonArray arr = new JsonArray();
				arr.add(json);

				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String j = gson.toJson(json);
				

				}

		
		}catch(Exception e) {
			
		}
}

}