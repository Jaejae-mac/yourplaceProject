package com.yourplace.host.chart.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.yourplace.host.chart.dao.HostChartDAO;
import com.yourplace.host.chart.vo.HostChartVO;

@Service
public class HostChartServiceImpl implements HostChartService{

	@Inject
	private HostChartDAO dao;
	
	
	@Override
	public List<HostChartVO> getChartData(HostChartVO vo) throws Exception {
		return dao.getChartData(vo);
	}


	@Override
	public List<HostChartVO> getInvoiceChart(HostChartVO vo) throws Exception {
		return dao.getInvoiceChart(vo);
	}

}

