package com.yourplace.custom.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yourplace.custom.login.service.LoginUserService;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.mypage.service.MyPageCouponService;
import com.yourplace.custom.mypage.service.MyPageDeleteService;
import com.yourplace.custom.mypage.service.MyPageReviewService;
import com.yourplace.custom.mypage.service.MyPageService;
import com.yourplace.custom.mypage.service.MyPageUpdateService;
import com.yourplace.custom.mypage.vo.MyPageCouponVO;
import com.yourplace.custom.mypage.vo.MyPageGuestReviewVO;
import com.yourplace.custom.mypage.vo.MyPageHostReviewVO;

@Controller
public class MypageController {
	@Autowired
	private MyPageService mypageService;
	@Autowired
	private MyPageUpdateService mypageupdateService;
	@Autowired
	private MyPageDeleteService mypagedeleteService;
	@Autowired
	private MyPageCouponService couponservice;
	@Autowired
	private LoginUserService loginUserService;
	@Autowired
	private MyPageReviewService mypagereviewService;
	// 마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypageForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", mypageService.getUser(vo));
		return "mypage/mypage";
	}
	// 프로필 수정페이지 이동
	@RequestMapping("/gopagefix.do")
	public String goMypagefix(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		model.addAttribute("user", mypageService.getUser(vo));
		System.out.println(model);
		return "mypage/mypagefix";
	}
	// 프로필 수정
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) throws IOException{
		System.out.println("[mypageController] updateUser 기능");
		System.out.println(vo.toString());
		int type = vo.getUserType();
		if(type==0) {
			mypageupdateService.updateUser(vo);
			System.out.println("업데이트 완료");
			return "redirect:mypage.do";
		}else {
			mypageupdateService.updateUser(vo);
			System.out.println("업데이트 완료");
			return "redirect:myProfile.hdo";
		}

	}
	// 회원 탈퇴 기능 
	@RequestMapping("/deleteUser.do")
	public String deleteBoard(HttpServletRequest request, UserVO uvo) {
		System.out.println("[mypageController] deleteUser 기능");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String userImg = uvo.getUserProfileImg();
		int num = uvo.getUserNum();
		UserVO vo = new UserVO();
		// 디폴트이미지일 경우 해당유저 프로필 경로로 재설정
		if(userImg.equals("profile/default/defaultprofile.png")) {
			userImg = "profile/guest/"+num+"/ThumbImg.png";
			vo.setUserProfileImg(userImg);
		}
		System.out.println("유저 아이디 : " + userId + "이미지 :" + userImg);
		vo.setUserId(userId);
		mypagedeleteService.deleteUser(vo);
		mypagedeleteService.deleteInterest(vo);
		MyPageCouponVO cvo = new MyPageCouponVO();
		cvo.setUserCoupId(userId);
		couponservice.deleteCoupon(cvo);
		MyPageGuestReviewVO grvo = new MyPageGuestReviewVO();
		grvo.setUserId(userId);
		mypagereviewService.deleteGuestReview(grvo);
		MyPageHostReviewVO hrvo = new MyPageHostReviewVO();
		hrvo.setRsvId(userId);
		mypagereviewService.deleteHostReview(hrvo);
		session.invalidate();
		return "redirect:home.do";
	}
	// 쿠폰 페이지 이동
	@RequestMapping("/gocoupon.do")
	public String getCouponList(HttpServletRequest request, Model model) {
		System.out.println("[coupcontroller getCouponList 기능 수행]");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageCouponVO vo = new MyPageCouponVO();
		vo.setUserCoupId(userId);
		System.out.println(vo.toString());
		model.addAttribute("couponList",couponservice.getCouponList(vo) );
		System.out.println(model);
		return "mypage/mypagecoupon";
	}
	//비밀번호 확인 페이지 이동
	@RequestMapping("/gocheckPw.do")
	public String gocheckPw(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("userVO");
		session.setAttribute("userVO", user);
		return "mypage/mypagecheckPw";
	}
	//비밀번호 변경페이지 이동
	@RequestMapping("/gochangPw.do")
	public String MypageChangPw(UserVO vo, HttpServletRequest request, Model model) {
		System.out.println("[MypageController MypageChangPw 기능 수행]");
		System.out.println(vo.toString());
		UserVO result = loginUserService.getUser(vo);
		if(result.getLoginCheck() == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", result);
			return "mypage/MyPageresetPw";
		}
		model.addAttribute("result", 0);
		return "mypage/mypagecheckPw";
	}
	//비밀번호 변경
	@RequestMapping("/updatePw.do")
	public String UpdatePw(UserVO vo) {
		System.out.println("[Mypagecontroller UpdatePw 기능 수행]");
		int type = vo.getUserType();
		if(type==0) {
			mypageupdateService.updatePw(vo);
			return "redirect:mypage.do";
		}else {
			mypageupdateService.updatePw(vo);
			return "redirect:myProfile.hdo";
		}

	}
	//리뷰
	@RequestMapping("/mypagereviewList.do")
	@ResponseBody
	public List<MyPageHostReviewVO> getreviewList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageHostReviewVO vo = new MyPageHostReviewVO();
		vo.setRsvId(userId);
		System.out.println(vo.toString());
		List<MyPageHostReviewVO> tvo =mypagereviewService.getReviewList(vo);
		return tvo;
	}
}
