package com.yourplace.custom.reservation.service;

import java.util.List;

import com.yourplace.custom.reservation.vo.RsvVO;


public interface RsvGetReservationService {
	List<RsvVO> getReservation(RsvVO vo);
}
