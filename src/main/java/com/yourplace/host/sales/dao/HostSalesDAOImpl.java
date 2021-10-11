package com.yourplace.host.sales.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.sales.vo.HostSalesVO;

@Repository
public class HostSalesDAOImpl implements HostSalesDAO {

	@Inject
	private SqlSession session;

	@Override
	public List<HostSalesVO> getAllSales(HostSalesVO vo) throws Exception {
		return session.selectList("hostSalesMapper.getAllSales", vo);
	}


	
}
