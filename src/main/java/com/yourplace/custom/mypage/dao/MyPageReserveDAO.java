package com.yourplace.custom.mypage.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yourplace.custom.mypage.vo.MyPageReserveVO;

public interface MyPageReserveDAO {
	List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListAll(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListEnd(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListCancel(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordList(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordListAll(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordListEnd(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getkeywordListCancel(MyPageReserveVO vo);
	
	void updateReserve(MyPageReserveVO vo);
	
	void updatereviewYn(MyPageReserveVO vo);
}
