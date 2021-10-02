package com.yourplace.admin.revenue.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.revenue.dao.RevenueDAO;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Service("revenueMonthService")
public class RevenueMonthServiceImpl implements RevenueMonthService {

	@Autowired
	private RevenueDAO revenueDAO;

	@Override
	public List<RevenueVO> getMonthSumFirst(int year) {
		System.out.println("[Service] getMonthSumFirst 실행");
		System.out.println("[Service] 입력받은 year : " + year);
		System.out.println(year + " 년도의 월별 매출을 조회합니다.");
		List<RevenueVO> list = revenueDAO.getMonthSumFirst(year);
		return list;
	}

	@Override
	public List<Double> getMoM(int year) {
		System.out.println("[Service] " + year + " 년도의 월대비 성장률을 조회하기 위해, 전체 월간 매출 데이터를 조회");
		List<RevenueVO> list = revenueDAO.getMonthSumFirst(year);
		
		int minus = -1;
		Double mom = null;
		List<Double> revList = new ArrayList<Double>(); //월별 데이터 담을 리스트 초기화, long 타입 -> 음수, 소수점 표현
		
		//1월인 get(0) 부터 12월인 get(11) 의 revenue 까지 조회
		for(int i = 1; i < (list.size()) ; i++)
		{
			
			int lastmonth = list.get(i-1).getRevenue(); // 저번달
			int thismonth = list.get(i).getRevenue(); // 이번달
			
			int a = thismonth - lastmonth;
			
			System.out.println("------- " + i + "월과 " + (i+1) + "월의 매출 -------");
			System.out.println((i) +"월 매출: "+ lastmonth);
			System.out.println((i+1) +"월 매출: " + thismonth);
			System.out.println("매출차: " + a); // 음수일 경우, 따로 처리
			System.out.println("----------------------------");
			
			System.out.println("lastmonth: " + lastmonth);
			System.out.println("minus: " + minus);
			
			
			mom = new Double((a / (double)lastmonth)*100);
			System.out.println("MoM : " + mom);
			revList.add(mom);
			
		}

		System.out.println("MOM 계산 결과: " + revList.toString());
		
		return revList;
		
	}
	 
		
		
}


