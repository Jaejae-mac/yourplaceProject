package com.yourplace.admin.space.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.space.vo.SpaceVO;


@Repository("spaceDAO")
public class SpaceDAOImpl implements SpaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	//장소목록 조회
	@Override
	public List<SpaceVO> getSpaceList() {
		System.out.println("---> MyBatis getSpaceList 기능 처리: 전체 장소 조회");
		return sqlSessionTemplate.selectList("SpaceDAO.getSpaceList");
	}


	//장소삭제
	@Override
	public void deleteSpace(int deleteSpace) {
		System.out.println("---> MyBatis 로 deleteSpace 기능 처리");
		System.out.println("삭제할 space: " + deleteSpace);
		sqlSessionTemplate.delete("SpaceDAO.deleteSpace", deleteSpace); // 장소 테이블에서 삭제
		sqlSessionTemplate.delete("SpaceDAO.deleteSpaceImg", deleteSpace); // 이미지 테이블에서 삭제
		sqlSessionTemplate.delete("SpaceDAO.deleteSpaceDetail", deleteSpace); // 세부정보 테이블에서 삭제
	}

	
	//이미지테이블에서 s3 url 조회
	@Override
	public List<SpaceVO> selectSpaceImgUrl(int deleteSpace) {
		System.out.println("---> MyBatis 로 selectSpaceImgUrl 기능 처리");
		List<SpaceVO> vo = sqlSessionTemplate.selectList("SpaceDAO.selectSpaceImgUrl", deleteSpace);
		System.out.println("[DAOimpl] 삭제할 space 의 이미지 url: " + vo.toString());
		return vo;
	}
	
	
	//장소승인
	@Override
	public void enableSpace(String spaceNum) {
		System.out.println("---> MyBatis 로 enableSpace 기능 처리");
		sqlSessionTemplate.update("SpaceDAO.enableSpace", spaceNum);
	}


	//장소승인 거절
	@Override
	public void disableSpace(String spaceNum) {
		System.out.println("---> MyBatis 로 disableSpace 기능 처리");
		sqlSessionTemplate.update("SpaceDAO.disableSpace", spaceNum);
		
	}


	@Override
	public SpaceVO getSpaceActive(String spaceNum) {
		System.out.println("---> MyBatis 로 getSpaceActive 기능 처리: 장소 승인상태 조회");
		return (SpaceVO) sqlSessionTemplate.selectOne("SpaceDAO.getSpaceActive", spaceNum);
	}


	@Override
	public String selectSpaceThumbImgUrl(int deleteSpace) {
		System.out.println("---> MyBatis 로 selectSpaceThumbImgUrl 기능 처리: 썸네일 삭제를 위한 썸네일 key 조회");
		String key = sqlSessionTemplate.selectOne("SpaceDAO.selectSpaceThumbImgUrl", deleteSpace);
		System.out.println("[DAOimpl] 삭제할 space 의 썸네일 이미지 url: " + key);
		return key;
	}


	@Override
	public List<SpaceVO> beforeAllow() {
		System.out.println("---> MyBatis 로 beforeAllow 기능 처리: index 용");
		List<SpaceVO> list = sqlSessionTemplate.selectList("SpaceDAO.beforeAllow");
		return list;
	}



	@Override
	public void disableSpaceWithId(String userId) {
		System.out.println("---> MyBatis 로 disableSpaceWithId 기능 처리 : 멤버 정지시 사용");
		sqlSessionTemplate.update("SpaceDAO.disableUserId", userId);
		
	}

}
