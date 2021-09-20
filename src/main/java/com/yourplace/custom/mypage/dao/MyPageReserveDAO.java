package com.yourplace.custom.mypage.dao;

import java.util.List;

import com.yourplace.custom.mypage.vo.MyPageReserveVO;

public interface MyPageReserveDAO {
	List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo);
}
