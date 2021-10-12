package com.yourplace.host.reserv.dao;

import java.util.List;

import com.yourplace.host.reserv.vo.HostReservVO;

public interface HostReservDAO {
	List<HostReservVO> getAllReserve(HostReservVO vo) throws Exception;
	void updatePlaceDetail() throws Exception;
	List<HostReservVO> lastReserve(HostReservVO vo) throws Exception;
}