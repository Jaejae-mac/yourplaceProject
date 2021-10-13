package com.yourplace.custom.mypage.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.mypage.dao.MyPageReviewDAO;
import com.yourplace.custom.mypage.vo.MyPageGuestReviewVO;
import com.yourplace.custom.mypage.vo.MyPageHostReviewVO;
@Repository("MyPageReviewDAO")
public class MyPageReviewDAOImpl implements MyPageReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<MyPageHostReviewVO> getReviewList(MyPageHostReviewVO vo) {
		System.out.println("--> MyBatis로 getMyReviewList() 기능 처리");
		List<MyPageHostReviewVO> tvo =sqlSessionTemplate.selectList("ReviewDAO.getMyReviewList",vo);
		System.out.println(tvo);
		return tvo;
	}
	@Override
	public MyPageHostReviewVO reviewCntAvg(MyPageHostReviewVO vo) {
		return sqlSessionTemplate.selectOne("ReviewDAO.getReviewRate",vo);
	}
	@Override
	public void insertGuestReview(MyPageGuestReviewVO vo) {
		sqlSessionTemplate.insert("ReviewDAO.insertGuestReview",vo);
	}
	@Override
	public void deleteGuestReview(MyPageGuestReviewVO vo) {
		sqlSessionTemplate.delete("ReviewDAO.deleteGuestReview",vo);
	}
	@Override
	public void deleteHostReview(MyPageHostReviewVO vo) {
		sqlSessionTemplate.delete("ReviewDAO.deleteHostReview",vo);
	}
}
