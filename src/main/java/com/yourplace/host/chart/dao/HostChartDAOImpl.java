package com.yourplace.host.chart.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.chart.vo.HostChartVO;

@Repository
public class HostChartDAOImpl implements HostChartDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public List<HostChartVO> getChartData(HostChartVO vo) throws Exception {
		return session.selectList("HostChartMapper.getAllChart", vo);
	}

	@Override
	public List<HostChartVO> getInvoiceChart(HostChartVO vo) throws Exception {
		return session.selectList("HostChartMapper.getinvoiceChart", vo);
	}
	

}
