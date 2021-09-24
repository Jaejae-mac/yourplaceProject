package com.yourplace.host.management.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.management.vo.HostManagementVO;

@Repository
public class HostManagementDAOImpl implements HostManagementDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<HostManagementVO> getAllHostPlace(HostManagementVO vo) throws Exception {
		return session.selectList("HostManagementMapper.getAllHostPlace", vo);
		
	}

	@Override
	public void deletePlace(int placeNum) throws Exception {
		session.delete("HostManagementMapper.deletePlace", placeNum);
		
	}

}
