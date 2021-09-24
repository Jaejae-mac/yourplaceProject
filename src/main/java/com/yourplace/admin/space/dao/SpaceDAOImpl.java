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
	
	@Override
	public List<SpaceVO> getSpaceList() {
		System.out.println("---> MyBatis getSpaceList 기능 처리: 전체 장소 조회");
		return sqlSessionTemplate.selectList("SpaceDAO.getSpaceList");
	}


	@Override
	public void deleteSpace(String deleteSpace) {
		System.out.println("---> MyBatis 로 deleteSpace 기능 처리");
		System.out.println("삭제할 space: " + deleteSpace);
		sqlSessionTemplate.delete("SpaceDAO.deleteSpace", deleteSpace); // 장소 삭제
		sqlSessionTemplate.delete("SpaceDAO.deleteSpaceImg", deleteSpace); // 이미지 삭제
		sqlSessionTemplate.delete("SpaceDAO.deleteSpaceDetail", deleteSpace); // 세부정보 삭제
	}

	
	@Override
	public void enableSpace(String spaceNum) {
		System.out.println("---> MyBatis 로 enableSpace 기능 처리");
		sqlSessionTemplate.update("SpaceDAO.enableSpace", spaceNum);
	}


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

}
