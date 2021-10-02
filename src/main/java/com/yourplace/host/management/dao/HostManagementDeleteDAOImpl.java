package com.yourplace.host.management.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.management.vo.HostManagementImgVO;

@Repository
public class HostManagementDeleteDAOImpl implements HostManagementDeleteDAO {

	@Inject
	private SqlSession session;

	@Override
	public List<HostManagementImgVO> getDeleteList(int placeNum) throws Exception {
		return session.selectList("HostManagementMapper.imgDelete", placeNum);
	}
	
}
