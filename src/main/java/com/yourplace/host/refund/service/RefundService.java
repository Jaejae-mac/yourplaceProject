package com.yourplace.host.refund.service;

import java.util.List;

import com.yourplace.host.refund.vo.RefundVO;

public interface RefundService {
	List<RefundVO> getAllDate(RefundVO vo) throws Exception;
	void update(RefundVO vo) throws Exception;
	List<RefundVO> getRefund(RefundVO vo) throws Exception;
}
