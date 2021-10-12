package com.yourplace.host.chart.dao;

import java.util.List;

import com.yourplace.host.chart.vo.HostChartVO;

public interface HostChartDAO {
List<HostChartVO> getChartData(HostChartVO vo) throws Exception; 
List<HostChartVO> getInvoiceChart(HostChartVO vo) throws Exception;
}
