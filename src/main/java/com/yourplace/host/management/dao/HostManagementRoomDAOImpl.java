package com.yourplace.host.management.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.management.vo.HostManagementRoomVO;

@Repository
public class HostManagementRoomDAOImpl implements HostManagementRoomDAO {
	@Inject
	private SqlSession session;

	@Override
	public List<HostManagementRoomVO> getRoomList(HostManagementRoomVO vo) throws Exception {
		return session.selectList("HostManagementRoomMapper.getAllHostRoom", vo);
	}

	@Override
	public void deleteRoom(String detailNum) throws Exception {
		session.delete("HostManagementRoomMapper.deleteRoom", detailNum);
		
	}

	@Override
	public void insertRoom(HostManagementRoomVO vo) throws Exception {
		session.insert("HostManagementRoomMapper.insertRoom",vo);
		
	}

	
	

}
