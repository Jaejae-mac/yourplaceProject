package com.yourplace.admin.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.reserve.dao.ReserveViewDAO;
import com.yourplace.admin.reserve.vo.ReserveVO;

@Service("reserveViewService")
public class ReserveViewServiceImpl implements ReserveViewService {

	@Autowired
	private ReserveViewDAO reserveViewDAO;
	
	@Override
	public List<ReserveVO> getReserve() {
		List<ReserveVO> list = reserveViewDAO.getReserve();
		return list;
	}

}
