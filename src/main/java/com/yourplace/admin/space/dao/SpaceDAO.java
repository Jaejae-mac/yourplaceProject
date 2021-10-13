package com.yourplace.admin.space.dao;

import java.util.List;

import com.yourplace.admin.space.vo.SpaceVO;

public interface SpaceDAO {
	
	//장소 조회
	List<SpaceVO> getSpaceList();
	
	//장소 삭제
	void deleteSpace(int deleteSpace);
	
	//이미지테이블에서 s3 url 조회
	List<SpaceVO> selectSpaceImgUrl(int deleteSpace);
	
	//장소테이블에서 thumb 조회
	String selectSpaceThumbImgUrl(int deleteSpace);
	
	//장소 승인
	void enableSpace(String spaceNum);
	
	void disableSpaceWithId(String userId);
	
	//장소 미승인
	void disableSpace(String spaceNum);
	
	//장소 승인 상태
	SpaceVO getSpaceActive(String spaceNum);
	
	//승인 대기중인 장소 전부 조회
	List<SpaceVO> beforeAllow();
	
}
