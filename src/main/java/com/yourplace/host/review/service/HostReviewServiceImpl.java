package com.yourplace.host.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yourplace.host.review.dao.HostReviewDAO;
import com.yourplace.host.review.vo.HostReviewVO;

@Service
public class HostReviewServiceImpl implements HostReviewService{

	@Inject
	HostReviewDAO dao;

	@Override
	public List<HostReviewVO> getReviewList(HostReviewVO vo) throws Exception {
		return dao.getReviewList(vo);
	}

	@Override
	public void insertReviewForHost(HostReviewVO vo) throws Exception {
		dao.insertReviewForHost(vo);
		
	}

	@Override
	public void updateReviewYN(HostReviewVO vo) throws Exception {
		dao.updateReviewYN(vo);
		
	}

	@Override
	public List<HostReviewVO> getDetailReview(HostReviewVO vo) throws Exception {
		return dao.getDetailReview(vo);
	}
}
