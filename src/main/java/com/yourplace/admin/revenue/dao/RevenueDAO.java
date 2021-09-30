package com.yourplace.admin.revenue.dao;

import java.util.HashMap;
import java.util.List;

import com.yourplace.admin.revenue.vo.RevenueVO;

public interface RevenueDAO {

	
	List<RevenueVO> getMonthSum();
	
	//Monthly Sum with Year
	List<RevenueVO> getMonthSumwithYear();
	
	//payYear 값 필요한 Monthly Sum
	List<RevenueVO> getMonthSumFirst(int year);
	
	//전체 예약건수
	List<RevenueVO> getRsvCount();
	
	//payYear 값 필요한 예약건수
	List<RevenueVO> getRsvCountFirst(int year);
	
	//메인 카테고리 예약 건수 + payYear 필요
	List<RevenueVO> getMainCateRank(int year);
	
	//서브 카테고리 예약건수
	List<RevenueVO> getSubCateRank(int year);
	
	//연도, 시작-종료 월 입력, 날짜별 금액만 도출
	List<RevenueVO> getTermMonth(RevenueVO vo);
	
	//연도, 시작-종료 월, 시작-종료 일 입력, 날짜별 금액만 도출
	List<RevenueVO> getTermMonthNDate(RevenueVO vo);
	
	//연도, 시작-종료 월 입력, 전체정보 조회
	List<RevenueVO> getTermAllMonth(RevenueVO vo);
	
	//연도, 시작-종료 월, 시작-종료 일 입력, 전체정보 조회
	List<RevenueVO> getTermAllMonthNDate(RevenueVO vo);
	
	
	
}
