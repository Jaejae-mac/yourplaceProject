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
	public List<HostManagementRoomVO> getRoomList() throws Exception {
		return session.selectList("HostManagementRoomMapper.getAllHostRoom");
	}

	@Override
	public void deleteRoom(int placeNum) throws Exception {
		session.delete("HostManagementRoomMapper.deleteRoom", placeNum);
		
	}
	

}
