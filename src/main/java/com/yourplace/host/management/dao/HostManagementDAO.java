package com.yourplace.host.management.dao;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementVO;

public interface HostManagementDAO {
	List<HostManagementVO> getAllHostPlace() throws Exception;
	void deletePlace(int placeNum) throws Exception;
}
