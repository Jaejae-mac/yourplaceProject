package com.yourplace.host.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yourplace.host.review.vo.HostReviewVO;

@Repository
public class HostReviewDAOImpl implements HostReviewDAO {
	
	@Inject
	SqlSession session;
	

	@Override
	public List<HostReviewVO> getReviewList(HostReviewVO vo) throws Exception {
		
		return session.selectList("HostReviewMapper.getAllReview", vo);
	}


	@Override
	public void insertReviewForHost(HostReviewVO vo) throws Exception {
		session.insert("HostReviewMapper.insertReview", vo);
		
	}
	

}
