package com.yourplace.host.sales.dao;

import java.util.List;

import com.yourplace.host.sales.vo.HostSalesVO;

public interface HostSalesDAO {
List<HostSalesVO> getAllSales(HostSalesVO vo) throws Exception;
}
