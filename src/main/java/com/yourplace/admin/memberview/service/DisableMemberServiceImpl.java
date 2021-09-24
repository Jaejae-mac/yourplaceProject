package com.yourplace.admin.memberview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.memberview.dao.MemberDAO;
import com.yourplace.admin.memberview.vo.MemberVO;

@Service("memDisable")
public class DisableMemberServiceImpl implements DisableMemberService {

	@Autowired
	private MemberDAO memDAO;

	@Override
	public void disableMember(String disableUserId) {

		MemberVO vo = memDAO.getMemberActive(disableUserId);
		String active = vo.getUserActive();
		
		if(active.equals("1"))
		{
			memDAO.disableMember(disableUserId); // 1 -> 0
			
		} else
		{
			memDAO.enableMember(disableUserId); // 0 -> 1
		}
		
		System.out.println("변경된 회원상태: " + active);
		
	}
	
	

}
