package com.yourplace.admin.revenue.service;

import java.util.List;

import com.yourplace.admin.revenue.vo.RevenueVO;

public interface RevenueCntService {

		//전체 예약건수
		List<RevenueVO> getRsvCount();
		
		//payYear 값 필요한 예약건수
		List<RevenueVO> getRsvCountFirst(int year);
		
		//메인 카테고리 예약 건수 + payYear 필요
		List<RevenueVO> getMainCateRank(int year);
		
		//서브 카테고리 예약건수
		List<RevenueVO> getSubCateRank(int year);
	
		//index 인기장소
		List<RevenueVO> indexTable();
		
}
