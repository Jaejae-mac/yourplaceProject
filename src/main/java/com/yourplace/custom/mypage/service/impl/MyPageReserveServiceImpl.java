package com.yourplace.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.mypage.dao.MyPageReserveDAO;
import com.yourplace.custom.mypage.service.MyPageReserveService;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;

@Service("myPageReserveService")
public class MyPageReserveServiceImpl implements MyPageReserveService {
	@Autowired
	private MyPageReserveDAO dao;
	@Override
	public List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo) {
		return dao.getMyReserveList(vo);
	}

}
