package com.yourplace.custom.reservation.controller;

import java.text.DecimalFormat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.yourplace.custom.interest.service.ChkMyBookmarkService;
import com.yourplace.custom.interest.vo.InterestVO;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.custom.reservation.service.GetDetailInfoList;
import com.yourplace.custom.reservation.service.GetImgInfoService;
import com.yourplace.custom.reservation.service.GetMyCouponListService;
import com.yourplace.custom.reservation.service.GetPlaceService;
import com.yourplace.custom.reservation.service.ReviewService;
import com.yourplace.custom.reservation.vo.CouponVO;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;
import com.yourplace.custom.reservation.vo.ReviewVO;
import com.yourplace.custom.reservation.vo.RsvVO;

@Controller
public class DetailController {
	// 기본 등록된 방정보를 불러오기 위한 서비스.
	@Autowired
	private GetPlaceService getPlaceService;
	// 기본, 방1 방2 와같은 상세 방정보를 불러오기 위한 서비스.
	@Autowired
	private GetDetailInfoList getDetailInfoList;
	// 이미지 목록을 불러오기 위한 서비스.
	@Autowired
	private GetImgInfoService getImgInfoService;
	// 쿠폰목록을 불러오기 위한 서비스.
	@Autowired
	private GetMyCouponListService getMyCouponListService;
	// 리뷰리스트를 불러오기 위한 서비스.
	@Autowired
	private ReviewService reviewService;
	// 북마크 존재여부 확인용 서비스.
	@Autowired
	private ChkMyBookmarkService chkMyBookmarkService;

	@GetMapping("/detailPlaceForm.do")
	public String detailPlaceForm(@RequestParam("placeNum") String placeNum, Model model, HttpServletRequest request) {
		PlaceInfoVO vo = new PlaceInfoVO();
		DetailPlaceVO dvo = new DetailPlaceVO();
		ReviewVO rvo = new ReviewVO();
		InterestVO bookMarkVO = null;
		HttpSession session = request.getSession();
		// 유저가 로그인한 상태라면 북마크 체크여부를 확인해주어야 한다.
		if (session.getAttribute("userVO") != null) {
			bookMarkVO = new InterestVO();
			bookMarkVO.setPlaceNum(Integer.parseInt(placeNum));
			bookMarkVO.setUserId(((UserVO) session.getAttribute("userVO")).getUserId());
			boolean mybookmark = chkMyBookmarkService.chkMyBookmark(bookMarkVO);
			model.addAttribute("bookmark", mybookmark);
		} else {
			model.addAttribute("bookmark", false);
		}

		dvo.setPlaceNum(Integer.parseInt(placeNum));
		vo.setPlaceNum(Integer.parseInt(placeNum));
		rvo.setPlaceNum(Integer.parseInt(placeNum));
		rvo.setRowNum(0);
		PlaceInfoVO placeInfo = getPlaceService.getPlaceInfo(vo);
		System.out.println("THUMBNAIL : "+ placeInfo.getPlaceThumb());
		List<PlaceImgVO> imgList = getImgInfoService.getImgInfo(Integer.parseInt(placeNum));
		List<DetailPlaceVO> detailInfoList = getDetailInfoList.getDetailInfo(dvo);
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);

		String[] htArr = placeInfo.getPlaceTag().split("#");
		System.out.println(htArr.toString());
		List<String> hashTags = new ArrayList<String>();
		for (int i = 0; i < htArr.length; i++) {
			if (htArr[i].length() > 0) {
				hashTags.add(htArr[i]);
			}
		}
		placeInfo.setHashTags(hashTags);
		placeInfo.setPlaceRule(placeInfo.getPlaceRule().replace("\r\n", "<br>"));
		placeInfo.setPlaceSurinfo(placeInfo.getPlaceSurinfo().replace("\r\n", "<br>"));
		placeInfo.setPlaceIntro(placeInfo.getPlaceIntro().replace("\r\n", "<br>"));
		placeInfo.setRateHeader(placeInfo.getAvgRate().substring(0, 1));
		placeInfo.setImgCnt(imgList.size() - 1);

		System.out.println(placeInfo.toString());
		System.out.println(imgList);
		System.out.println(detailInfoList);
		model.addAttribute("placeInfo", placeInfo);
		model.addAttribute("imgList", imgList);
		model.addAttribute("detailInfoList", detailInfoList);
		model.addAttribute("reviewList", reviewList);
		// 리뷰 더보기 클릭 시 마지막 로우넘을 서버로 보내 마지막 로우넘 이후 5개를 더 불러와 붙여야 하므로 모델에 값을 적용.
		model.addAttribute("rowNum", 0);
		return "detailPlaceForm";
	}

	@PostMapping("/reserveForm.do")
	public String reserveForm(RsvVO vo, Model model, HttpServletRequest request,
			@RequestParam("placeNum") int placeNum) {
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		// 세션이 존재하지 않으면 예약을 처리하지 못하도록 처리해야함.
		HttpSession session = request.getSession();
		if (session.getAttribute("userVO") != null) {
			DetailPlaceVO dvo = new DetailPlaceVO();
			dvo.setPlaceNum(placeNum);
			System.out.println("[ POST ] : DetailController - reserveForm");
			String userCoupId = ((UserVO) session.getAttribute("userVO")).getUserId();
			//유저가 가진 사용가능한 쿠폰목록을 불러온다.
			List<CouponVO> myCouponList = getMyCouponListService.getMyCouponList(userCoupId);
			PlaceInfoVO pvo = new PlaceInfoVO();
			pvo.setPlaceNum(placeNum);
			PlaceInfoVO placeInfoVO = getPlaceService.getPlaceInfo(pvo);
			System.out.println(vo.toString());
			System.out.println(placeNum);
			//예약한종료시간 - 시작시간 = 총 예약한 시간.
			int hours = vo.getRsvEndT() - vo.getRsvStartT();
			// 금액 계산.(시간당 가격 * 시간)
			int totalPrice = resultPrice(Integer.parseInt(placeInfoVO.getPlaceExtrachrg()), Integer.parseInt(vo.getPlacePrice()), vo.getHeadCount(),
					Integer.parseInt(placeInfoVO.getPlaceCapa()), hours);
			//가격을 000,000,000 ... 과같은 형식으로 맞춰주기 위해 포맷을변경한다.
			String price = dc.format(Double.parseDouble(String.valueOf(totalPrice)));
			vo.setPlacePrice(String.valueOf(price));
			vo.setPlaceNum(placeNum);
			model.addAttribute("myCouponList", myCouponList);
			model.addAttribute("reserving", "1");
			model.addAttribute("placeInfo", vo);
			model.addAttribute("detailNum", vo.getDetailNum());
			model.addAttribute("placeMaincate", vo.getPlaceMaincate());
			model.addAttribute("placeCate", vo.getPlaceCate());

			return "reservation/reserveForm";
		}
		// 만약 세션이 존재하지 않는다면 접근거부로 판단 로그인 창으로 보내주어야한다.
		model.addAttribute("accessDenied", "accessDenied");
		return "redirect:loginForm.do";
	}

	@GetMapping("/rsvResult.do")
	public String rsvResultForm() {
		System.out.println("hi");
		return "reservation/rsvResult";
	}

	// 가격 계산 메서드.
	public int resultPrice(int surchargeType, int price, int headCount, int defaultCapa, int hour) {

		/*
		 * 0 : 인원 초과시 50% 할증 , 2배 초과사 100%할증, 3배 초과시 150% 할증. 
		 * 1 : 1인 추가시 시간당 5500원추가, 
		 * 2 : 1인 추가 시 시간당 11000원
		 */
		int rstPrice = 0;
		int overhead = headCount - defaultCapa;// 초과된 인원수.
		int overPrice = 0;
		switch (surchargeType) {
		case 0:
			// 기존 인원보다 2배 많냐?
			if (headCount > defaultCapa * 2) {

				// 기존 인원보다 3배 많냐.?
				if (headCount > defaultCapa * 3) {
					// 기본 인원보다 3배 많을시.
					overPrice = price + (int) (price * 1.5);
				} else {
					// 기본 인원보다 2배많을시.
					overPrice = price + price;
				}
			} else {
				// 기본인원만 충족했거나, 2배에는 미치지 않는다면.
				if (overhead != 0) {
					// 기본인원보단 많고 2배에는 미치지않는다면.
					overPrice = price + (int) (price * 0.5);
				} else {
					// 기본인원만 충족한다면.
					overPrice = price;
				}
			}
			rstPrice = overPrice * hour;
			break;
		case 1:
			overPrice = (price + (overhead*5500));
			rstPrice = overPrice * hour;
			break;
		case 2:
			overPrice = (price + (overhead*11000));
			rstPrice = overPrice * hour;
			break;
		}
		return rstPrice;
	}
}
