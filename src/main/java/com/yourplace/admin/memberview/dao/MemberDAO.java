package com.yourplace.admin.memberview.dao;

import java.util.List;

import com.yourplace.admin.memberview.vo.MemberVO;

public interface MemberDAO {

	//회원 조회 (전체)
	List<MemberVO> getMemberList();
	
	//회원 삭제 (일부 또는 전체)
	void deleteMember(String deleteUserId);
	
	//회원 상태 조회
	MemberVO getMemberActive(String disableUserId);
	
	//회원 비활성화
	void disableMember(String disableUserId);
	
	//회원 활성화
	void enableMember(String disableUserId);
	
}
