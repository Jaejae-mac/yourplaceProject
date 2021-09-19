package com.yourplace.host.management.dao;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementRoomVO;

public interface HostManagementRoomDAO {
 List<HostManagementRoomVO> getRoomList() throws Exception;
 void deleteRoom(int placeNum) throws Exception;
}
