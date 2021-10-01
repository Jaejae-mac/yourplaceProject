package com.yourplace.custom.reservation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.yourplace.custom.reservation.dao.RsvDAO;
import com.yourplace.custom.reservation.service.RsvGetReservationService;
import com.yourplace.custom.reservation.vo.RsvVO;
import com.yourplace.custom.reserve.vo.ReserveVO;

@Service("rsvGetReservationService")
public class RsvGetReservationServiceImpl implements RsvGetReservationService {

	@Autowired
	private RsvDAO rsvDAO;
	
	@Override
	public List<RsvVO> getReservation(RsvVO vo) {
		
		return rsvDAO.getReservation(vo);
	}

}
