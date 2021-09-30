package com.yourplace.host.management.service;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementVO;

public interface HostManagementService {
	List<HostManagementVO> getAllHostPlace(HostManagementVO vo) throws Exception;
	void deletePlace(int placeNum) throws Exception;
	List<HostManagementVO> getOneHostPlace(HostManagementVO vo) throws Exception;
	void updatePlace(int placeNum, HostManagementVO vo) throws Exception;

}
