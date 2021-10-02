package com.yourplace.custom.interest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.custom.interest.service.InterestService;
import com.yourplace.custom.interest.vo.InterestVO;

@Controller
public class InterestController {

	@Autowired
	private InterestService interestService;

	@GetMapping("/interest.do")
	public String interestForm(Model model, HttpServletRequest request) {
		System.out.println("[InterestController]interest.jsp 호출 ");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
//		Integer placeNum = (Integer)session.getAttribute("placNum");
		InterestVO vo = new InterestVO();
		vo.setUserId(userId);
//		vo.setPlaceNum(placeNum);
		System.out.println(vo.toString());
		List<InterestVO> list = interestService.interestView(vo);
		model.addAttribute("interestList", list);
		System.out.println(model);
		return "interest/interestForm";
	}

	@RequestMapping("/insertinter.do")
	public String insertInter(Model model, HttpServletRequest request) {
		System.out.println("[interestController] 관심장소 등록하기");
		HttpSession session = request.getSession();
		String userIdse =(String) session.getAttribute("userId");
		String placeNumse =(String) session.getAttribute("placeNum");
		
		
		String placeNum = request.getParameter("placeNum");
		String userId =  request.getParameter("userId");

		
		InterestVO vo = new InterestVO();
//		vo.setPlaceNum(placeNum);
		System.out.println("placeNum 가져온 값 :" + placeNum);
		System.out.println("userId 가져온 값  " + userId);
		vo.setUserId(userId);
		
		model.addAttribute("userId", userIdse);
		model.addAttribute("pNum", placeNumse);
		System.out.println();
//		interestService.insertInter(vo);
		// 리턴값으로 줘야할 경로 생각하기.
		return null;
	}
	
	// delete 문 처리 중
	@RequestMapping("/deleteinter.do")
	public String deleteInter(@RequestParam int placeNum) {
		System.out.println("[interestController] 관심장소 삭제하기");
		interestService.deleteInter(placeNum);
		return null;
	}
	
//	@RequestMapping("/deleteUser.do")
//	public String deleteBoard(HttpServletRequest request) {
//		System.out.println("[mypageController] deleteUser 기능");
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("userId");
//		System.out.println("유저 아이디" + userId);
//		UserVO vo = new UserVO();
//		vo.setUserId(userId);
//		mypagedeleteService.deleteUser(vo);
//		session.invalidate();
//		return "redirect:home.do";
//	}
//	//신고하기 문의 등록 처리 메서드 INSERT
//		@RequestMapping("/guestreport.do")
//		public String guestReport(QuestionVO vo, HttpServletRequest request) {
//			System.out.println("[QuestionController] 신고하기 등록하기");
//			System.out.println(vo.toString());
//			HttpSession session2 = request.getSession();
//			session2.setAttribute("rsvNum", vo.getRsvNum());
//			session2.setAttribute("reprtContent", vo.getReprtContent());
//			reportService.insertReport(vo);
//			
//			return "redirect:quesForm.do";
//		}

}
