package com.yourplace.host.management.service;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementVO;

public interface HostManagementService {
	List<HostManagementVO> getAllHostPlace() throws Exception;
	void deletePlace(int placeNum) throws Exception;
}
