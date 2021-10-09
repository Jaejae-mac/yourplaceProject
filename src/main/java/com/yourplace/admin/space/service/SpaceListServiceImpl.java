package com.yourplace.admin.space.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.space.dao.SpaceDAO;
import com.yourplace.admin.space.vo.SpaceVO;

@Service("spaceList")
public class SpaceListServiceImpl implements SpaceListService {

	@Autowired
	private SpaceDAO spaceDAO;

	@Override
	public List<SpaceVO> getSpaceList() {
		List<SpaceVO> spaceVO = spaceDAO.getSpaceList();
		return spaceVO;
	}

	@Override
	public List<SpaceVO> beforeAllow() {
		List<SpaceVO> list = spaceDAO.beforeAllow();
		return list;
	}
	
	
	
}
