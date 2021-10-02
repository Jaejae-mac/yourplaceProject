package com.yourplace.custom.interest.dao;

import java.util.List;

import com.yourplace.custom.interest.vo.InterestVO;

public interface InterestDAO {

	List<InterestVO> interestView(InterestVO vo);
//	List<InterestVO> interestView(Integer placenum, String userid);
	
	//관심장소 등록하기 처리 메서드
	void insertInter(InterestVO vo);
	
	// 삭제 메서드 
	void deleteInter(int placeNum);
}
