package com.yourplace.admin.space.service;

import java.util.List;

import com.yourplace.admin.space.vo.SpaceVO;

public interface DeleteSpaceService {
	
	void deleteSpace(int deleteSpace);
	
	List<SpaceVO> selectSpaceImgUrl(int deleteSpace);

}
