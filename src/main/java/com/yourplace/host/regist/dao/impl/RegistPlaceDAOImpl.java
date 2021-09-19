package com.yourplace.host.regist.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.host.regist.dao.RegistPlaceDAO;
import com.yourplace.host.regist.vo.PlaceDetailVO;
import com.yourplace.host.regist.vo.PlaceImgVO;
import com.yourplace.host.regist.vo.PlaceVO;

@Repository("registPlaceDAO")
public class RegistPlaceDAOImpl implements RegistPlaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
		
	@Override
	public int getCurSeq() {
		
		return sqlSessionTemplate.selectOne("RegistPlaceDAO.getCurSeq");
	}

	@Override
	public void setPlaceDetail(PlaceDetailVO vo) {
		sqlSessionTemplate.insert("RegistPlaceDAO.insertPlaceDetail",vo);
	}

	@Override
	public void setPlaceImg(PlaceImgVO vo) {
		sqlSessionTemplate.insert("RegistPlaceDAO.insertPlaceImg",vo);
		
	}

	@Override
	public void setPlace(PlaceVO vo) {
		sqlSessionTemplate.insert("RegistPlaceDAO.insertPlace",vo);
		
	}

	@Override
	public void updateThumb(PlaceVO vo) {
		sqlSessionTemplate.update("RegistPlaceDAO.updateThumbnail",vo);
		
	}
	
	

}
