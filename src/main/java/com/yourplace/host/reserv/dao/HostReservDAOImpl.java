package com.yourplace.host.reserv.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.reserv.vo.HostReservVO;

@Repository
public class HostReservDAOImpl implements HostReservDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<HostReservVO> getAllReserve(HostReservVO vo) throws Exception {
		return session.selectList("HostReservMapper.getAllReserve", vo);
	}

	

	@Override
	public void updatePlaceDetail() throws Exception {
		session.update("HostReservMapper.updatePlaceDetail");
		
	}



	@Override
	public List<HostReservVO> lastReserve(HostReservVO vo) throws Exception {
		return session.selectList("HostReservMapper.getLast", vo);
	}


	

}
