package com.yourplace.host.refund.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.refund.dao.RefundDAO;
import com.yourplace.host.refund.vo.RefundVO;

@Service
public class RefundServiceImpl implements RefundService{
@Inject
private RefundDAO dao;
	
	@Override
	public List<RefundVO> getAllDate(RefundVO vo) throws Exception {
		return dao.getAllDate(vo);
		
	}

	@Override
	public void update(RefundVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public List<RefundVO> getRefund(RefundVO vo) throws Exception {
		return dao.getRefund(vo);
	}



}
