package com.yourplace.admin.space.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.space.dao.SpaceDAO;

@Service("allowSpaceService")
public class AllowSpaceServiceImpl implements AllowSpaceService {

	@Autowired
	private SpaceDAO spaceDAO;
	
	@Override
	public void allowSpace(String spaceNum) {
		
		System.out.println("Allow Space Service");
		spaceDAO.enableSpace(spaceNum);

	}

	@Override
	public void denySpace(String spaceNum) {
		
		System.out.println("Deny Space Service");
		spaceDAO.disableSpace(spaceNum);

	}

	@Override
	public void denySpacewithId(String id) {
		System.out.println("[Service] 장소 전부 비승인 처리 : 정지된 유저의 장소");
		spaceDAO.disableSpaceWithId(id);
	}

}
