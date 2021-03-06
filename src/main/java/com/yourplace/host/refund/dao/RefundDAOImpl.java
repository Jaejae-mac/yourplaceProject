package com.yourplace.host.refund.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.refund.vo.RefundVO;

@Repository
public class RefundDAOImpl implements RefundDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<RefundVO> getAllDate(RefundVO vo) throws Exception {
		return session.selectList("HostRefundMapper.getAllReserveDate", vo);
	}

	@Override
	public void update(RefundVO vo) throws Exception {
		session.update("HostRefundMapper.updateRefund", vo);
		
	}

	@Override
	public List<RefundVO> getRefund(RefundVO vo) throws Exception {
		return session.selectList("HostRefundMapper.getRefundConfirm", vo);
	}


}
