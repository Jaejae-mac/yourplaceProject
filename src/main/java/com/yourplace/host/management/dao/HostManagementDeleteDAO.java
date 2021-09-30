package com.yourplace.host.management.dao;

import java.util.List;

import com.yourplace.host.management.vo.HostManagementImgVO;

public interface HostManagementDeleteDAO {
	List<HostManagementImgVO> getDeleteList(int placeNum) throws Exception;
}
