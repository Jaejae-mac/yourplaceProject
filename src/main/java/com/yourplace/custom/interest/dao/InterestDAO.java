package com.yourplace.custom.interest.dao;

import java.util.List;

import com.yourplace.custom.interest.vo.InterestVO;

public interface InterestDAO {

	List<InterestVO> interestView(InterestVO vo);
	
	//관심장소 등록하기 처리 메서드
	void insertBookmark(InterestVO vo);
	
	// 삭제 메서드 
	void deleteBookmark(InterestVO vo);
	
	//북마크 존재여부확인.
	InterestVO checkBookmark(InterestVO vo);
}
