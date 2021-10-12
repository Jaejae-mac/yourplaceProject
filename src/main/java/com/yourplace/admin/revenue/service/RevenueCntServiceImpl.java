package com.yourplace.admin.revenue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.revenue.dao.RevenueDAO;
import com.yourplace.admin.revenue.vo.RevenueVO;

@Service("revenueCntService")
public class RevenueCntServiceImpl implements RevenueCntService {

	@Autowired
	private RevenueDAO revenueDAO;
	
	@Override
	public List<RevenueVO> getRsvCount() {
		System.out.println("[Service] 전체년도 전체월별 예약건수 조회");
		return revenueDAO.getRsvCount();
	}

	@Override
	public List<RevenueVO> getRsvCountFirst(int year) {
		System.out.println("[Service] " + year + " 년도의 월별 예약건수 조회");
		return revenueDAO.getRsvCountFirst(year);
	}

	@Override
	public List<RevenueVO> getMainCateRank(int year) {
		System.out.println("[Service] " + year + " 년도의 메인 카테고리별 예약건수 조회");
		List<RevenueVO> list = revenueDAO.getMainCateRank(year);
		return list;
	}

	@Override
	public List<RevenueVO> getSubCateRank(int year) {
		System.out.println("[Service] " + year + " 년도의 서브 카테고리별 예약건수 조회");
		List<RevenueVO> list = revenueDAO.getSubCateRank(year);
		return list;
	}

	@Override
	public List<RevenueVO> indexTable() {
		System.out.println("[Service] index용 인기장소 테이블 조회");
		List<RevenueVO> list = revenueDAO.indexTable();
		return list;
	}

}
