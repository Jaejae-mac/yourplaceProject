package com.yourplace.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.login.vo.UserVO;
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
	
	@Override
	public List<MyPageReserveVO> getMyReserveListAll(MyPageReserveVO vo) {
		return dao.getMyReserveListAll(vo);
	}
	
	@Override
	public List<MyPageReserveVO> getMyReserveListEnd(MyPageReserveVO vo) {
		return dao.getMyReserveListEnd(vo);
	}
	
	@Override
	public List<MyPageReserveVO> getMyReserveListCancel(MyPageReserveVO vo) {
		return dao.getMyReserveListCancel(vo);
	}
	@Override
	public List<MyPageReserveVO> getkeywordList(MyPageReserveVO vo) {
		return dao.getkeywordList(vo);
	}
	
	@Override
	public List<MyPageReserveVO> getkeywordListAll(MyPageReserveVO vo) {
		return dao.getkeywordListAll(vo);
	}
	
	@Override
	public List<MyPageReserveVO> getkeywordListEnd(MyPageReserveVO vo) {
		return dao.getkeywordListEnd(vo);
	}
	
	@Override
	public List<MyPageReserveVO> getkeywordListCancel(MyPageReserveVO vo) {
		return dao.getkeywordListCancel(vo);
	}
	@Override
	public void updateReserve(MyPageReserveVO vo) {
		dao.updateReserve(vo);
	}
	@Override
	public void updatereviewYn(MyPageReserveVO vo) {
		dao.updatereviewYn(vo);
	}
}
