package com.yourplace.host.management.service;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementRoomVO;
import com.yourplace.host.management.vo.HostManagementVO;

public interface HostManagementRoomService {
	 List<HostManagementRoomVO> getRoomList(HostManagementRoomVO vo) throws Exception;
	 void deleteRoom(int placeNum) throws Exception;
	 void insertRoom(HostManagementRoomVO vo) throws Exception;
}
