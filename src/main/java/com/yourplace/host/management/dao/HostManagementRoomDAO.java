package com.yourplace.host.management.dao;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementRoomVO;

public interface HostManagementRoomDAO {
 List<HostManagementRoomVO> getRoomList(HostManagementRoomVO vo) throws Exception;
 void deleteRoom(String detailNum) throws Exception;
 void insertRoom(HostManagementRoomVO vo) throws Exception;
}
