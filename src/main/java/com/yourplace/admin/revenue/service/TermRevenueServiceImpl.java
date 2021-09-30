package com.yourplace.admin.revenue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.revenue.dao.RevenueDAO;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Service("termRevenueService")
public class TermRevenueServiceImpl implements TermRevenueService {

	@Autowired
	private RevenueDAO revenueDAO;

	@Override
	public List<RevenueVO> getTermMonth(RevenueVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RevenueVO> getTermMonthNDate(RevenueVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RevenueVO> getTermAllMonth(RevenueVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RevenueVO> getTermAllMonthNDate(RevenueVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	

}
