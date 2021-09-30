package com.yourplace.host.management.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.management.dao.HostManagementDeleteDAO;
import com.yourplace.host.management.vo.HostManagementImgVO;

@Service
public class HostManagementDeleteServiceImpl implements HostManagementDeleteService {

	@Inject
	private HostManagementDeleteDAO dao;
	@Override
	public List<HostManagementImgVO> getDeleteList(int placeNum) throws Exception {
		return dao.getDeleteList(placeNum);
	}

}
