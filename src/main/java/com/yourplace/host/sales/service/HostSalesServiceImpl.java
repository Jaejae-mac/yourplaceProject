package com.yourplace.host.sales.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.sales.dao.HostSalesDAO;
import com.yourplace.host.sales.vo.HostSalesVO;

@Service
public class HostSalesServiceImpl implements HostSalesService {

	@Inject
	private HostSalesDAO dao;

	@Override
	public List<HostSalesVO> getAllSales(HostSalesVO vo) throws Exception {
		return dao.getAllSales(vo);
	}
	
}
