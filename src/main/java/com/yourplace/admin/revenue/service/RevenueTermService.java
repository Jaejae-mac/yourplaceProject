package com.yourplace.admin.revenue.service;

import java.util.List;

import com.yourplace.admin.revenue.vo.RevenueVO;

public interface RevenueTermService {

	List<RevenueVO> getTermMonth(RevenueVO vo);
	
	List<RevenueVO> getTermMonthNDate(RevenueVO vo);
	
	List<RevenueVO> getTermAllMonth(RevenueVO vo);
	
	List<RevenueVO> getTermAllMonthNDate(RevenueVO vo);
	
}
