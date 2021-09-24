package com.yourplace.custom.question.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.question.dao.QuestionDAO;
import com.yourplace.custom.question.vo.GuestInfoVO;
import com.yourplace.custom.question.vo.HostInfoVO;
import com.yourplace.custom.question.vo.QuestionVO;

@Repository("QeustionDAO")
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void guestQues(QuestionVO vo) {
		sqlSessionTemplate.insert("GuestQuesDAO.insertQues", vo);

	}

	@Override
	public void guestReport(QuestionVO vo) {
		sqlSessionTemplate.insert("GuestQuesDAO.insertReport", vo);
	}

	@Override
	public List<GuestInfoVO> guestInfoView(GuestInfoVO vo) {
		System.out.println("---> MyBatis로 guestInfoView() 기능 처리");
		List<GuestInfoVO> Guestlist = sqlSessionTemplate.selectList("InfoDAO.guestInfo", vo);
		System.out.println("[QuestionDAO]"+ Guestlist.toString());
		return Guestlist;
	}
	
	@Override
	public List<HostInfoVO> hostInfoView(HostInfoVO vo) {
		System.out.println("---> MyBatis로 hostInfoView() 기능 처리");
		List<HostInfoVO> Hostlist = sqlSessionTemplate.selectList("InfoDAO.hostInfo", vo);
		System.out.println("[QuestionDAO]"+ Hostlist.toString());
		return Hostlist;
	}

}
