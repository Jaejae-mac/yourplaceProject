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
	public List<HostReviewVO> getReviewList() throws Exception {
		return dao.getReviewList();
	}
}
