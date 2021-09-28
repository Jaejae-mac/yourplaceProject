package com.yourplace.admin.space.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.space.dao.SpaceDAO;
import com.yourplace.admin.space.vo.SpaceVO;

@Service("deleteSpaceService")
public class DeleteSpaceServiceImpl implements DeleteSpaceService {

	@Autowired
	private SpaceDAO spaceDAO;
	
	@Override
	public void deleteSpace(int deleteSpace) {
		System.out.println("deleteSpace Service 실행");
		spaceDAO.deleteSpace(deleteSpace);

	}

	@Override
	public List<SpaceVO> selectSpaceImgUrl(int deleteSpace) {
		System.out.println("S3 서버에서 이미지 삭제를 위해 place_num 을 통한 s3_file_name select");
		return spaceDAO.selectSpaceImgUrl(deleteSpace);
	}

}
