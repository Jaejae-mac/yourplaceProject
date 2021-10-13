package com.yourplace.custom.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.service.MyPageReserveService;
import com.yourplace.custom.mypage.service.MyPageReviewService;
import com.yourplace.custom.mypage.service.MyPageService;
import com.yourplace.custom.mypage.vo.MyPageGuestReviewVO;
import com.yourplace.custom.mypage.vo.MyPageReserveVO;

@Controller
public class MyPageReserveController {
	@Autowired
	private MyPageReserveService reserveservice;
	@Autowired
	private MyPageService mypageService;
	@Autowired
	private MyPageReviewService mypagereviewService;
	// 예약 리스트 
	@RequestMapping("/goreserve.do")
	public String goreserve(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");

		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", mypageService.getUser(vo));
		return "mypage/mypageReserve";
	}
	// 진행중에 해당하는 예약 리스트
	@RequestMapping("/reserveListIng.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveList(int num) {

		int userNum = num;

		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setUserNum(userNum);

		List<MyPageReserveVO> tvo =reserveservice.getMyReserveList(vo);

		return tvo;
	}
	// 전체에 해당하는 예약 리스트
	@RequestMapping("/reserveListAll.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListAll(int num) {

		int userNum = num;
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setUserNum(userNum);

		List<MyPageReserveVO> tvo =reserveservice.getMyReserveListAll(vo);

		return tvo;
	}
	// 지난 내역에 해당하는 예약리스트
	@RequestMapping("/reserveListEnd.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListEnd(int num) {

		int userNum = num;
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setUserNum(userNum);

		List<MyPageReserveVO> tvo =reserveservice.getMyReserveListEnd(vo);

		return tvo;
	}
	// 취소에 해당하는 예약리스트
	@RequestMapping("/reserveListCancel.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListCancel(int num) {

		int userNum = num;
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setUserNum(userNum);

		List<MyPageReserveVO> tvo =reserveservice.getMyReserveListCancel(vo);

		return tvo;
	}
	// 예약 검색 기능
	@RequestMapping("/reserveListkeyword.do")
	@ResponseBody
	public List<MyPageReserveVO> getReserveListkeyWord(String keyword,String title, int num) {
		
		int userNum = num;
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setUserNum(userNum);
		vo.setSearchKeyword(keyword);
		
		String Ing = "진행중";
		String All = "전체";
		String End = "지난내역";
		String Cancal ="취소";
		if(title.equals(Ing)) {
			
			List<MyPageReserveVO> tvo =reserveservice.getkeywordList(vo);
			
			return tvo;
		}else if(title.equals(All)) {
			
			List<MyPageReserveVO> tvo =reserveservice.getkeywordListAll(vo);
			
			return tvo;
		}else if(title.equals(End)) {
			
			List<MyPageReserveVO> tvo =reserveservice.getkeywordListEnd(vo);
			
			return tvo;
		}else if(title.equals(Cancal)) {
			
			List<MyPageReserveVO> tvo =reserveservice.getkeywordListCancel(vo);
			
			return tvo;
		}else {
			return null;
		}
	}
	// 정상예약을 환불진행중으로 바꾸는 컨트롤러
	@RequestMapping("/mypagerefund.do")
	@ResponseBody
	public String updateUser(String rsvNum){
		
		
		MyPageReserveVO vo = new MyPageReserveVO();
		vo.setRsvNum(rsvNum);
		reserveservice.updateReserve(vo);
		return "success";
	}
	// 리뷰 컨트롤러
	@RequestMapping("/insertGuestReview.do")
	public String insertReview(MyPageGuestReviewVO vo) {
		
		String rsvNum = vo.getRsvNum();
		MyPageReserveVO tvo = new MyPageReserveVO();
		tvo.setRsvNum(rsvNum);
		reserveservice.updatereviewYn(tvo);
		
		mypagereviewService.insertGuestReview(vo);		
		return "redirect:goreserve.do";
	}
}
