package com.yourplace.admin.revenue.dao;

import java.util.HashMap;
import java.util.List;

import com.yourplace.admin.revenue.vo.RevenueVO;

public interface RevenueDAO {

	List<RevenueVO> getMonthSum();
	
//	HashMap<Integer, Integer> getRevenue();
	
	//MoM
	List<HashMap<Integer, Integer>> getList();

	//MoM with Year
	List<HashMap<Integer, Integer>> getMoMwithYear();
	
}
