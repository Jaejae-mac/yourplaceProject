package com.yourplace.custom.mypage.service;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageReserveVO;

public interface MyPageReserveService {
	List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListAll(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListEnd(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListCancel(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordList(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordListAll(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordListEnd(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordListCancel(MyPageReserveVO vo);
	
	void updateReserve(MyPageReserveVO vo);
}
