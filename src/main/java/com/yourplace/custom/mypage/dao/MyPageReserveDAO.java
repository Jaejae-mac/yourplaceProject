package com.yourplace.custom.mypage.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yourplace.custom.mypage.vo.MyPageReserveVO;

public interface MyPageReserveDAO {
	List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListAll(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListEnd(MyPageReserveVO vo);
	
	List<MyPageReserveVO> getMyReserveListCancel(MyPageReserveVO vo);
	
	void updateReserve(MyPageReserveVO vo);

}
