package com.yourplace.custom.reservation.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;
import com.yourplace.custom.reserve.vo.ReserveVO;

@Repository("rsvDAO")
public class RsvDAOImpl implements RsvDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ReserveVO> getReservation(ReserveVO vo) {
		return sqlSessionTemplate.selectList("ReserveMapper.getRsvList",vo);
	}
	
	@Override
	public DetailPlaceVO getDetailInfo(DetailPlaceVO vo) {
		return sqlSessionTemplate.selectOne("ReserveMapper.getDetail", vo);
	}

	@Override
	public List<DetailPlaceVO> getDetailInfoList(DetailPlaceVO vo) {
		return sqlSessionTemplate.selectList("ReserveMapper.getDetailInfoList",vo);
	}

	@Override
	public PlaceInfoVO getPlaceInfo(PlaceInfoVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("ReserveMapper.getPlaceInfo",vo);
	}

	@Override
	public List<PlaceImgVO> getImgList(PlaceImgVO vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("ReserveMapper.getImgList",vo);
	}

}
