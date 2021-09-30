package com.yourplace.host.management.service;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementImgVO;

public interface HostManagementDeleteService {
	List<HostManagementImgVO> getDeleteList(int placeNum) throws Exception;
}
