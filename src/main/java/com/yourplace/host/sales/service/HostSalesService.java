package com.yourplace.host.sales.service;

import java.util.List;

import com.yourplace.host.sales.vo.HostSalesVO;

public interface HostSalesService {
List<HostSalesVO> getAllSales(HostSalesVO vo) throws Exception;
}
