package com.yourplace.admin.memberview.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.memberview.vo.MemberVO;

@Repository("memDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MemberVO> getMemberList() {
		System.out.println("---> MyBatis로 getMember 기능 처리: 전체 회원 조회1");
		return sqlSessionTemplate.selectList("MemberDAO.getMemberList");
	}

//	@Override
//	public List<MemberVO> getMemberListTwo(MemberVO vo) {
//		System.out.println("---> MyBatis로 getMember 기능 처리: 전체 회원 조회2");
//		return sqlSessionTemplate.selectList("MemberDAO.getMemberList", vo);
//	}

	@Override
	public void deleteMember(String deleteUserId) {
		System.out.println("---> MyBatis로 deleteMember() 기능 처리: 회원 삭제");
		sqlSessionTemplate.delete("MemberDAO.deleteMember", deleteUserId);
		System.out.println("[MemberDAO] delete 정상 수행");
	}

	@Override
	public void disableMember(String disableUserId) {
		System.out.println("---> MyBatis로 disableMember() 기능 처리: 회원 비활성화");
		sqlSessionTemplate.update("MemberDAO.disableMember", disableUserId);
	}

	@Override
	public void enableMember(String disableUserId) {
		System.out.println("---> MyBatis로 enableMember() 기능 처리: 회원 활성화");
		sqlSessionTemplate.update("MemberDAO.enableMember", disableUserId);	
	}
	
	@Override
	public MemberVO getMemberActive(String disableUserId)
	{
		System.out.println("---> MyBatis로 getMemberActive() 기능 처리: 회원 상태 조회");
		return (MemberVO) sqlSessionTemplate.selectOne("MemberDAO.getMemberActive", disableUserId);
	}
	
}
