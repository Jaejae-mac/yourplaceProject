package com.yourplace.custom.hostProfile.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.hostProfile.dao.HtProfileDAO;
import com.yourplace.host.login.vo.HostVO;

@Repository("HtProfileDAO")
public class HtProfileDAOImpl implements HtProfileDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public HostVO hostProfile(HostVO vo){
		System.out.println("[HtProfileDAO] Mabatis로 처리");
		return (HostVO) sqlSessionTemplate.selectOne("HostDAO.getHostInfo",vo);
	}

	@Override
	public List<PlaceCardVO> getHostPlaceList(HostVO vo) {
		
		return sqlSessionTemplate.selectList("HomeDAO.getHostPlaceList",vo);
	}
	
}
