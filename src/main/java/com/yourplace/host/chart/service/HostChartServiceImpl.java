package com.yourplace.host.chart.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.yourplace.host.chart.dao.HostChartDAO;
import com.yourplace.host.chart.vo.HostChartVO;

@Service
public class HostChartServiceImpl implements HostChartService{

	@Inject
	private HostChartDAO dao;
	
	
	@Override
	public List<HostChartVO> getChartData(HostChartVO vo) throws Exception {
		return dao.getChartData(vo);
	}
//
//	@Override
//	public void getChartDataToJson(HostChartVO vo) throws Exception {
//
//		
//		
//		
//		
		
//		
//		JSONObject col1 = new JSONObject(); //컬럼은 12개월이고 로우는 개수 제한 없이
//		JSONObject col2 = new JSONObject();
//		JSONObject col3 = new JSONObject();
//		JSONObject col4 = new JSONObject();
//		JSONObject col5 = new JSONObject();
//		JSONObject col6 = new JSONObject();
//		JSONObject col7 = new JSONObject();
//		JSONObject col8 = new JSONObject();
//		JSONObject col9 = new JSONObject();
//		JSONObject col10 = new JSONObject();
//		JSONObject col11 = new JSONObject();
//		JSONObject col12 = new JSONObject();
//		
//		
//		JSONArray A = new JSONArray();
//		col1.put("label", "1월");
//		col1.put("type", "number");
//	
//		col2.put("label", "2월");
//		col2.put("type", "int");
//
//		col3.put("label", "3월");
//		col3.put("type", "int");
//
//		col4.put("label", "4월");
//		col4.put("type", "int");
//
//		col5.put("label", "5월");
//		col5.put("type", "int");
//		
//		col6.put("label", "6월");
//		col6.put("type", "int");
//		
//		col7.put("label", "7월");
//		col7.put("type", "int");
//		
//		col8.put("label", "8월");
//		col8.put("type", "int");
//
//		col9.put("label", "9월");
//		col9.put("type", "int");
//		
//		col10.put("label", "10월");
//		col10.put("type", "int");
//
//		col11.put("label", "11월");
//		col11.put("type", "int");
//		
//		col12.put("label", "12월");
//		col12.put("type", "int");
//		
//		A.add(col1);
//		A.add(col2);
//		A.add(col3);
//		A.add(col4);
//		A.add(col5);
//		A.add(col6);
//		A.add(col7);
//		A.add(col8);
//		A.add(col9);
//		A.add(col10);
//		A.add(col11);
//		A.add(col12);
//		
//		data.put("cols", A);
//		
//		try {
//			
//		
//		JSONArray body = new JSONArray(); //배열사용 객체
//	
//		for(int i=0; i<=list.size(); i++) {
//			String month = list.get(i).getReserveMonth();
//			System.out.println(month);
//			
//			   if(month.equals("1")) {
//		           JSONObject Jan = new JSONObject();
//		           Jan.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Jan);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//		            
//				   }
//				
//			   if(month.equals("2")) {
//		           JSONObject Feb = new JSONObject();
//		           Feb.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Feb);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("3")) {
//		           JSONObject Mar = new JSONObject();
//		           Mar.put("month", month);
//		           JSONArray row = new JSONArray();
//		           row.add(Mar);
//		           JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("4")) {
//		           JSONObject April = new JSONObject();
//		           April.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(April);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("5")) {
//		           JSONObject May = new JSONObject();
//		           May.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(May);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("6")) {
//		           JSONObject June = new JSONObject();
//		           June.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(June);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("7")) {
//		           JSONObject July = new JSONObject();
//		           July.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(July);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("8")) {
//		           JSONObject Aug = new JSONObject();
//		           Aug.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Aug);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("9")) {
//		           JSONObject Sep = new JSONObject();
//		           Sep.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Sep);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("10")) {
//		           JSONObject Oct = new JSONObject();
//		           Oct.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Oct);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("11")) {
//		           JSONObject Nov = new JSONObject();
//		           Nov.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Nov);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//				
//			   if(month.equals("12")) {
//		           JSONObject Dec = new JSONObject();
//		           Dec.put("month", month);
//		           JSONArray row = new JSONArray();
//				   row.add(Dec);
//				   JSONObject cell = new JSONObject();
//				   cell.put("m", row);
//				   body.add(cell);
//				   data.put("rows", body);
//			   }
//			   	   
//		}
//		}catch(Exception e) {
//			
//		}
//
//		return data;
//
//		}
}

