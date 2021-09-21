package com.yourplace.host.management.service;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementRoomVO;

public interface HostManagementRoomService {
	 List<HostManagementRoomVO> getRoomList() throws Exception;
	 void deleteRoom(int placeNum) throws Exception;
	 void insertRoom(HostManagementRoomVO vo) throws Exception;
}
