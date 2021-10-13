package com.yourplace.custom.mypage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyPageHostReviewVO {
	//RowNum
	private int rowNum;
	// 예약번호
	private String rsvNum;
	// 게스트 아이디
	private String rsvId;
	// 호스트 아이디
	private String userId;
	// 장소 번호
	private int placeNum;
	// 리뷰 평점
	private int reviewGuestRate;
	// 리뷰 내용
	private String reviewGuestWr;
	// 리뷰 등록일
	private String reviewGuestRegd;
	
	private int orderFlag = 0;
	
	int lastRowNum = 3;
	//리뷰 더보기 버튼 활성화여부.
	boolean reviewMoreBtn;
	//리뷰 총 개수.
	int reviewCnt;
	//리뷰 전체 평균.
	double avgReview;
}
