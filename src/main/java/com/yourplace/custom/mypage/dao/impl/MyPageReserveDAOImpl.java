package com.yourplace.custom.mypage.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.dao.MyPageReserveDAO;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;
@Repository("MyPageReserveDAO")
public class MyPageReserveDAOImpl implements MyPageReserveDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MyPageReserveVO> getMyReserveList(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getMyReserveList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getMyReserveList",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getMyReserveListAll(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getMyReserveList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getMyReserveListAll",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getMyReserveListEnd(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getMyReserveList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getMyReserveListEnd",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getMyReserveListCancel(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getMyReserveList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getMyReserveListCancel",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getkeywordList(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getkeywordList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getkeywordList",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getkeywordListAll(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getkeywordList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getkeywordListAll",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getkeywordListEnd(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getkeywordList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getkeywordListEnd",vo);
		return tvo;
	}
	@Override
	public List<MyPageReserveVO> getkeywordListCancel(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 getkeywordList() 기능 처리");
		List<MyPageReserveVO> tvo =sqlSessionTemplate.selectList("ReserveMapper.getkeywordListCancel",vo);
		return tvo;
	}
	@Override
	public void updateReserve(MyPageReserveVO vo) {
		System.out.println("--> MyBatis로 updateReserve() 기능 처리");
		sqlSessionTemplate.update("ReserveMapper.updateReserve", vo);
	}
}
