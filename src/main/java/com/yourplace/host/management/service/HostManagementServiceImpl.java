package com.yourplace.host.management.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.management.dao.HostManagementDAO;
import com.yourplace.host.management.vo.HostManagementVO;

@Service
public class HostManagementServiceImpl implements HostManagementService{
	@Inject
	private HostManagementDAO dao;

	@Override
	public List<HostManagementVO> getAllHostPlace(HostManagementVO vo) throws Exception {
		return dao.getAllHostPlace(vo);
	}

	@Override
	public void deletePlace(int placeNum) throws Exception {
		dao.deletePlace(placeNum);
		
	}

	@Override
	public List<HostManagementVO> getOneHostPlace(HostManagementVO vo) throws Exception {
		return dao.getOneHostPlace(vo);
	}

}
