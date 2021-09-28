package com.yourplace.custom.reservation.service;

import java.util.List;

import com.yourplace.custom.reserve.vo.ReserveVO;


public interface RsvGetReservationService {
	List<ReserveVO> getReservation(ReserveVO vo);
}
