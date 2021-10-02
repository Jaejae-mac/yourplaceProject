package com.yourplace.admin.revenue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.revenue.dao.RevenueDAO;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Service("termRevenueService")
public class RevenueTermServiceImpl implements RevenueTermService {

	@Autowired
	private RevenueDAO revenueDAO;

	@Override
	public List<RevenueVO> getTermMonth(RevenueVO vo) {
		System.out.println("[Service] getTermMonth 서비스 실행");
		return revenueDAO.getTermMonth(vo);
	}

	@Override
	public List<RevenueVO> getTermMonthNDate(RevenueVO vo) {
		System.out.println("[Service] getTermMonthNDate 서비스 실행");
		return revenueDAO.getTermMonthNDate(vo);
	}

	@Override
	public List<RevenueVO> getTermAllMonth(RevenueVO vo) {
		System.out.println("[Service] getTermAllMonth 서비스 실행");
		return revenueDAO.getTermAllMonth(vo);
	}

	@Override
	public List<RevenueVO> getTermAllMonthNDate(RevenueVO vo) {
		System.out.println("[Service] getTermAllMonthNDate 서비스 실행");
		return revenueDAO.getTermAllMonthNDate(vo);
	}
	
	
	

}
