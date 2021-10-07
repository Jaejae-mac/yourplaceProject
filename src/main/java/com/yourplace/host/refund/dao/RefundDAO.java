package com.yourplace.host.refund.dao;

import java.util.List;

import com.yourplace.host.refund.vo.RefundVO;

public interface RefundDAO {
	List<RefundVO> getAllDate(RefundVO vo) throws Exception;
	void update(RefundVO vo) throws Exception;
	List<RefundVO> getRefund(RefundVO vo) throws Exception;
}
