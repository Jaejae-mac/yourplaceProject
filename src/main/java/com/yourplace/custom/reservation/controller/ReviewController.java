package com.yourplace.custom.reservation.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yourplace.custom.reservation.service.CheckHelpBtnUserService;
import com.yourplace.custom.reservation.service.ClickedReviewService;
import com.yourplace.custom.reservation.service.GetHelpCnt;
import com.yourplace.custom.reservation.service.HelpCntService;
import com.yourplace.custom.reservation.service.ReviewService;
import com.yourplace.custom.reservation.vo.ReviewVO;

@RestController
public class ReviewController {
	
	//리뷰 목록을 얻어온다.
	@Autowired
	private ReviewService reviewService;
	
	//도움돼요 숫자를 1 올리거나 내린다.
	@Autowired
	private HelpCntService helpCntService;
	
	//클릭한 사용자 테이블에 추가해준다.
	@Autowired 
	private ClickedReviewService clickedReviewService;
	
	//도움돼요 숫자 업데이트 후 숫자를 현재 숫자를 알아온다.
	@Autowired
	private GetHelpCnt getHelpCnt;
	
	@Autowired
	private CheckHelpBtnUserService checkHelpBtnUserService;
	
	//리뷰 더보기.
	@GetMapping(value="/moreReviews.do")
	@CrossOrigin(origins = "*")
	public List<ReviewVO> additionalReviews(
			@RequestParam(value ="rn", required=false) String rowNum,
			@RequestParam(value ="pn", required=false) String placeNum
			){
		System.out.println(rowNum);
		System.out.println(placeNum);
		ReviewVO vo = new ReviewVO();
		vo.setRowNum(Integer.parseInt(rowNum));
		vo.setPlaceNum(Integer.parseInt(placeNum));
		List<ReviewVO> moreReviewList = reviewService.reviewList(vo);
		return moreReviewList;
	}
	@GetMapping(value="/clickHelp.do")
	@CrossOrigin(origins = "*")
	public ReviewVO clickHelp(@RequestParam(value ="rsvNum", required=false) String rsvNum,
			@RequestParam(value ="userId", required=false) String userId,
			@RequestParam(value ="clickedUserId", required=false) String clickedUserId
			) 
	{
		
		//도움돼요 버튼 클릭시 카운트 업데이트.
		ReviewVO vo = new ReviewVO();
		vo.setRsvNum(rsvNum);
		vo.setUserId(userId);
		vo.setClickedUserId(clickedUserId);
		ReviewVO check = checkHelpBtnUserService.checkHelpBtnUser(vo);
		//리뷰를 클릭한적이 있으면 숫자를 내리고 없다면 숫자를 올린다.
		if(check != null) {
			//클릭한적 있는거라면 true
			vo.setHelpFlag(true);
			helpCntService.updateHelpCnt(vo);
			clickedReviewService.clickedReview(vo);
		}else {
			//도움돼요를 클릭한적 없는거라면.
			vo.setHelpFlag(false);
			helpCntService.updateHelpCnt(vo);
			clickedReviewService.clickedReview(vo);
		}
		//최종 도움돼요 클릭수를 가져온다.
		
		ReviewVO helpCntVO = getHelpCnt.getHelpCnt(vo);
		System.out.println(helpCntVO.getHelpCnt());
		
		
		return helpCntVO;
		
	}
}
