package com.yourplace.admin.memberview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.memberview.dao.MemberDAO;
import com.yourplace.admin.memberview.service.DeleteMemberService;
import com.yourplace.admin.memberview.service.DisableMemberService;
import com.yourplace.admin.memberview.service.MemberListService;
import com.yourplace.admin.memberview.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberListService memList;
	
	@Autowired
	private DeleteMemberService memDelete;
	
	@Autowired
	private DisableMemberService memDisable;

	@GetMapping(value="/memberView.mdo")
	public void memberTable(Model model)
	{
		List<MemberVO> list = memList.getMemberList();
		
		System.out.println("--------- [MemberView Controller] 멤버 리스트 조회 --------- ");
		System.out.println(list.toString());
		
		model.addAttribute("memberList", list);
	}
	
	@PostMapping(value="/deleteMember.mdo")
	public String deletemember(@RequestParam("deleteUserId") String deleteUserId)
	{
		System.out.println("--------- 삭제할 아이디 조회 ---------");
		System.out.println("Parameter value: " + deleteUserId); //requestparam 으로 가져온 id값 찍어보기
		memDelete.deleteMember(deleteUserId);
		return "redirect:memberView.mdo"; //삭제 후 바로 Reload
	}
	
	@PostMapping(value="/disableMember.mdo")
	public String disableMember(@RequestParam("disableUserId") String disableUserId)
	{
		System.out.println("------ 정지할 아이디 조회 -------");
		System.out.println("Parameter value: " + disableUserId);
		memDisable.disableMember(disableUserId);
		return "redirect:memberView.mdo";
	}
	
	
}
