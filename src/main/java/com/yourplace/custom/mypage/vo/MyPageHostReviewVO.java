package com.yourplace.custom.mypage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyPageHostReviewVO {
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
	private Date reviewGuestRegd;
}
