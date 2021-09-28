package com.yourplace.custom.interest.dao;

import java.util.List;

import com.yourplace.custom.interest.vo.InterestVO;

public interface InterestDAO {

	List<InterestVO> interestView(InterestVO vo);
}
