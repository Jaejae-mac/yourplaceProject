package com.yourplace.custom.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yourplace.commons.awss3.AwsS3;
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
import com.yourplace.custom.reservation.service.GetImgInfoService;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.host.regist.vo.PlaceVO;

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
	@Autowired
	private GetImgInfoService getImgInfoService;
	// 마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypageForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");

		UserVO vo = new UserVO();
		MyPageHostReviewVO rvo = new MyPageHostReviewVO();
		int num = 0;
		vo.setUserId(userId);
		rvo.setRsvId(userId);
		rvo.setRowNum(num);
		List<MyPageHostReviewVO> reviewList = mypagereviewService.getReviewList(rvo);
		MyPageHostReviewVO avgAndCnt = mypagereviewService.getAvgCng(rvo);
		model.addAttribute("user", mypageService.getUser(vo));
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("rowNum", num);
		model.addAttribute("reviewCnt", avgAndCnt.getReviewCnt());
		model.addAttribute("avgReview", avgAndCnt.getAvgReview());
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
		return "mypage/mypagefix";
	}
	// 프로필 수정
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) throws IOException{
		int type = vo.getUserType();
		if(type==0) {
			mypageupdateService.updateUser(vo);

			return "redirect:mypage.do";
		}else {
			mypageupdateService.updateUser(vo);

			return "redirect:myProfile.hdo";
		}

	}
	// 회원 탈퇴 기능 
	@RequestMapping("/deleteUser.do")
	public String deleteBoard(HttpServletRequest request, UserVO uvo) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String userImg = uvo.getUserProfileImg();
		int num = uvo.getUserNum();
		int type = uvo.getUserType();
		UserVO vo = new UserVO();
		
		// 디폴트이미지일 경우 해당유저 프로필 경로로 재설정
		if(userImg.equals("profile/default/defaultprofile.png")) {
			userImg = "profile/guest/"+num+"/ThumbImg.png";
			vo.setUserProfileImg(userImg);
		}

		vo.setUserId(userId);
		if(type == 1) {
			PlaceVO pvo = new PlaceVO();
			pvo.setUserId(userId);
			List<PlaceVO> placeList = mypageService.getPlace(pvo);
			AwsS3 awsS3 = AwsS3.getInstance();	
			for(int i=0; i < placeList.size(); i ++) {
				int placenum = placeList.get(i).getPlaceNum();
				List<PlaceImgVO> imgList = getImgInfoService.getImgInfo(placenum);
				for(int j=0; j < imgList.size(); j++) {
					String key = imgList.get(j).getS3FileName();
					awsS3.delete(key);
				}
				mypagedeleteService.deletePlaceImgDetail(placenum);
			}
			mypagedeleteService.deletePlace(pvo);
		}
		mypagedeleteService.deleteUser(vo);
		if(type == 0) {
			mypagedeleteService.deleteInterest(vo);
		}
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

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		MyPageCouponVO vo = new MyPageCouponVO();
		vo.setUserCoupId(userId);

		model.addAttribute("couponList",couponservice.getCouponList(vo) );

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

		int type = vo.getUserType();
		if(type==0) {
			mypageupdateService.updatePw(vo);
			return "redirect:mypage.do";
		}else {
			mypageupdateService.updatePw(vo);
			return "redirect:myProfile.hdo";
		}

	}
	//리뷰 더보기.
		@GetMapping(value="/moreHostReviews.do")
		@ResponseBody
		public List<MyPageHostReviewVO> additionalReviews(int rowNum, String userId){

			MyPageHostReviewVO vo = new MyPageHostReviewVO();
			vo.setRowNum(rowNum);
			vo.setRsvId(userId);
			List<MyPageHostReviewVO> moreReviewList = mypagereviewService.getReviewList(vo);
			return moreReviewList;
		}

}
