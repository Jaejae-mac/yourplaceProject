package com.yourplace.admin.space.dao;

import java.util.List;

import com.yourplace.admin.space.vo.SpaceVO;

public interface SpaceDAO {
	
	//장소 조회
	List<SpaceVO> getSpaceList();
	
	//장소 삭제
	void deleteSpace(String deleteSpace);
	
	//장소 승인
	void enableSpace(String spaceNum);
	
	//장소 미승인
	void disableSpace(String spaceNum);
	
	//장소 승인 상태
	SpaceVO getSpaceActive(String spaceNum);
	
}
