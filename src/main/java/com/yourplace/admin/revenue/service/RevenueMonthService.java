package com.yourplace.admin.revenue.service;

import java.util.List;

import com.yourplace.admin.revenue.vo.RevenueVO;

public interface RevenueMonthService {

	List<RevenueVO> getMonthSum();
	
}
