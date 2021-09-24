package com.yourplace.admin.revenue.service;

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
	public List<RevenueVO> getMonthSum() {
		
		List<RevenueVO> list = revenueDAO.getMonthSum();
		return list;
	}

}
