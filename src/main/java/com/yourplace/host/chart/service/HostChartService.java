package com.yourplace.host.chart.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.yourplace.host.chart.vo.HostChartVO;

public interface HostChartService {
	List<HostChartVO> getChartData(HostChartVO vo) throws Exception; 
	List<HostChartVO> getInvoiceChart(HostChartVO vo) throws Exception;
}
