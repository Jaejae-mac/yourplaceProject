package com.yourplace.admin.revenue.dao;

import java.util.List;

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
		return sqlSessionTemplate.selectList("RevenueDAO.getMonthSum");
		
	}

}
