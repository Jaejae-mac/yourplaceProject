package com.yourplace.admin.revenue.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonProcessingException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.yourplace.admin.revenue.dao.RevenueDAO;
import com.yourplace.admin.revenue.service.GoogleChartService;
import com.yourplace.admin.revenue.service.RevenueMonthService;
import com.yourplace.admin.revenue.service.getListService;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Controller
public class RevenueController {
	
	@Autowired
	private RevenueMonthService revenueMonthService;
	
	@Autowired
	private getListService jsonListService;
	
	
	@Autowired
	private RevenueDAO revenueDAO;
	
	
	@GetMapping(value="/jsonTest.mdo")
	public String testForm()
	{
		return "jsonTest";
	}
	
	@ResponseBody
	@PostMapping(value="/jsonTest.mdo")
	public RevenueVO ajaxTest() throws Exception {
		
		RevenueVO vo = new RevenueVO();
		vo.setPayMonth(1); // 1월
		vo.setInvAftTax(1000); // 1000
		
		return vo;
	}
	
	
	@GetMapping(value="/revenueView.mdo")
	public String viewForm()
	{
		System.out.println("[Controller] Chart page 호출");
		
		
		
		return "revenueView";
	}
	
	
	@ResponseBody
	@PostMapping(value="/revenueView.mdo")
	public String revenueForm(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("[Controller] POST - chart 페이지에 ajax 데이터 전달");
		
		//mom
		List<HashMap<Integer, Integer>> list2 = revenueDAO.getList();
					
		//mom with year
		List<HashMap<Integer, Integer>> list3 = revenueDAO.getMoMwithYear();
		
		
		request.setAttribute("json", list2);

		
		String json = null;
		
		try {
			json = new ObjectMapper().writeValueAsString(list2);
		} 
		
		catch (com.fasterxml.jackson.core.JsonProcessingException e){
			e.printStackTrace();
		}
		
		return json;
	}
	
//	@ResponseBody
//	@GetMapping(value="/jsonTest.mdo")
//	public JSONObject revenueForm()
//	{
//		System.out.println("차트쏜다쏜다");
//		return googleChart.getChartData();
//	}
	
	/* @ResponseBody
	@GetMapping(value="/revenueView.mdo")
	public String revenueViewForm(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
	{
	 
		HashMap<String, Object> map = new HashMap();
		map.put("key1", "value1");
		map.put("key2", "value2");
		
		JSONObject jObj = new JSONObject(map);
		
		System.out.println("JSON DATA: " + jObj);
		
		mav.addObject("obj", jObj);
		
//		JSONObject data = new JSONObject();
//		JSONObject ajaxObjCols1 = new JSONObject();
//		JSONObject ajaxObjCols2 = new JSONObject();
//		JSONArray ajaxArryCols = new JSONArray();
//		
//		ajaxObjCols1.put("type", "string");
//		ajaxObjCols2.put("type", "number");
//		
//		ajaxArryCols.add(ajaxObjCols1);
//		ajaxArryCols.add(ajaxObjCols2);
		
//		mav = getCommonView(type, "", "test.detail");
//		JSONObject jObj = jsonListService.getJsonList(request, response);
		
		return "revenueView";
	} */
	
//	@GetMapping(value="/revenueView.mdo")
//	public @ResponseBody String chartView(Model model)
//	{
//		Gson gson = new Gson();
//		List<RevenueVO> list = revenueMonthService.getMonthSum();
//		return gson.toJson(list);
//	}
	
}
