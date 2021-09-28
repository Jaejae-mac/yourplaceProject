package com.yourplace.admin.revenue.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.revenue.vo.RevenueVO;

@Repository("revenueDAO")
public class RevenueDAOImpl implements RevenueDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<RevenueVO> getMonthSum() {
		
		System.out.println("---> MyBatis 로 getMonthSum 기능 처리");	
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getMonthSum");
		return list;
		
	}

	@Override
	public List<HashMap<Integer, Integer>> getList() {

		List<HashMap<Integer, Integer>> list = sqlSessionTemplate.selectList("RevenueDAO.getMonthSumMap");
		System.out.println("[DAO] MoM List 결과: " + list.toString());
		
		return list;
	}

	@Override
	public List<HashMap<Integer, Integer>> getMoMwithYear() {
		List<HashMap<Integer, Integer>> list = sqlSessionTemplate.selectList("RevenueDAO.getMonthSumwithYearMap");
		System.out.println("[DAO] MoM with Year List 결과: " + list.toString());
		return null;
	}

//	@Override
//	public HashMap<Integer, Integer> getRevenue() {
//		HashMap<Integer, Integer> list = sqlSessionTemplate.selectMap("ReserveDAO.getMonthSum", null, null);
//		return list;
//	}
	
}
