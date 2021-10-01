package com.yourplace.custom.reservation.service;

import com.yourplace.custom.reservation.vo.PaymentVO;
import com.yourplace.custom.reservation.vo.RsvVO;

public interface ReservationService {
	int registReservation(RsvVO vo,PaymentVO pvo);
}
