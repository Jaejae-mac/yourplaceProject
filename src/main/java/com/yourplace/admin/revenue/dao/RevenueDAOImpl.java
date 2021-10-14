package com.yourplace.admin.revenue.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.omg.PortableInterceptor.INACTIVE;
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
		System.out.println(list.toString());
		return list;
		
	}
	
	@Override
	public List<RevenueVO> getMonthSumwithYear() {
		System.out.println("---> MyBatis 로 getMonthSumwithYear 기능 처리");	
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getMonthSumwithYear");
		System.out.println(list.toString());
		return list;
	}
	
	@Override
	public List<RevenueVO> getMonthSumFirst(int year) {
		System.out.println("---> MyBatis 로 getMonthSumFirst 기능 처리");	
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getMonthSumFirst", year);
		return list;
	}

	
	@Override
	public List<RevenueVO> getRsvCount() {
		System.out.println("---> MyBatis 로 getRsvCount 기능 처리");	
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getRsvCount");
		return list;
	}

	@Override
	public List<RevenueVO> getRsvCountFirst(int year) {
		System.out.println("---> MyBatis 로 getRsvCountFirst 기능 처리");	
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getRsvCountFirst", year);
		return list;
	}

	@Override
	public List<RevenueVO> getMainCateRank(int year) {
		System.out.println("---> MyBatis 로 getMainCateRank 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getMainCateRank", year);
		return list;
	}

	@Override
	public List<RevenueVO> getSubCateRank(int year) {
		System.out.println("---> MyBatis 로 getSubCateRank 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getSubCateRank", year);
		return list;
	}

	@Override
	public List<RevenueVO> getTermMonth(RevenueVO vo) {
		System.out.println("---> MyBatis 로 getTermMonth 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getTermMonth", vo);
		return list;
	}

	@Override
	public List<RevenueVO> getTermMonthNDate(RevenueVO vo) {
		System.out.println("---> MyBatis 로 getTermMonthNDate 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getTermMonthNDateSum", vo);
		return list;
	}

	@Override
	public List<RevenueVO> getTermAllMonth(RevenueVO vo) {
		System.out.println("---> MyBatis 로 getTermAllMonth 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getTermAllMonth", vo);
		return list;
	}

	@Override
	public List<RevenueVO> getTermAllMonthNDate(RevenueVO vo) {
		System.out.println("---> MyBatis 로 getTermAllMonthNDate 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.getTermAllMonthNDate", vo);
		return list;
	}

	@Override
	public List<RevenueVO> indexChart() {
		System.out.println("---> MyBatis 로 indexChart 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.indexChart");
		return list;
	}

	@Override
	public List<RevenueVO> indexTable() {
		System.out.println("---> MyBatis 로 indexTable 기능 처리");
		List<RevenueVO> list = sqlSessionTemplate.selectList("RevenueDAO.indexTable");
		return list;
	}

}
