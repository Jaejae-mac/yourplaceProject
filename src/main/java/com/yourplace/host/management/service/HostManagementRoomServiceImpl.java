package com.yourplace.host.management.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.management.dao.HostManagementRoomDAO;
import com.yourplace.host.management.vo.HostManagementRoomVO;

@Service
public class HostManagementRoomServiceImpl implements HostManagementRoomService {

	@Inject
	private HostManagementRoomDAO dao;

	@Override
	public List<HostManagementRoomVO> getRoomList() throws Exception {
		return dao.getRoomList();
	}

	@Override
	public void deleteRoom(int placeNum) throws Exception {
		dao.deleteRoom(placeNum);
		
	}

	@Override
	public void insertRoom(HostManagementRoomVO vo) throws Exception {
		dao.insertRoom(vo);
		
	}
}
