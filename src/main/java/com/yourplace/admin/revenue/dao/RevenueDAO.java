package com.yourplace.admin.revenue.dao;

import java.util.List;

import com.yourplace.admin.revenue.vo.RevenueVO;

public interface RevenueDAO {

	List<RevenueVO> getMonthSum();
	
}
