package com.yourplace.host.refund.dao;

import java.util.List;

import com.yourplace.host.refund.vo.RefundVO;

public interface RefundDAO {
	List<RefundVO> getAllDate(RefundVO vo) throws Exception;
}
