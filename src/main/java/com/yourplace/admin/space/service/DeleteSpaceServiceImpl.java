package com.yourplace.admin.space.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.space.dao.SpaceDAO;

@Service("deleteSpaceService")
public class DeleteSpaceServiceImpl implements DeleteSpaceService {

	@Autowired
	private SpaceDAO spaceDAO;
	
	@Override
	public void deleteSpace(String deleteSpace) {
		System.out.println("deleteSpace Service 실행");
		spaceDAO.deleteSpace(deleteSpace);

	}

}
