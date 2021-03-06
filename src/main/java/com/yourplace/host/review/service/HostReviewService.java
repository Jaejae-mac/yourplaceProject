package com.yourplace.host.review.service;

import java.util.List;

import com.yourplace.host.review.vo.HostReviewVO;

public interface HostReviewService {
	List<HostReviewVO> getReviewList(HostReviewVO vo) throws Exception;
	void insertReviewForHost(HostReviewVO vo) throws Exception;
	void updateReviewYN(HostReviewVO vo)throws Exception;
	List<HostReviewVO> getDetailReview(HostReviewVO vo) throws Exception;
}
