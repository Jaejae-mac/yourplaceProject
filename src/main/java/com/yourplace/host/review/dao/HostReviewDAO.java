package com.yourplace.host.review.dao;

import java.util.List;

import com.yourplace.host.review.vo.HostReviewVO;

public interface HostReviewDAO {
	List<HostReviewVO> getReviewList() throws Exception;
}
