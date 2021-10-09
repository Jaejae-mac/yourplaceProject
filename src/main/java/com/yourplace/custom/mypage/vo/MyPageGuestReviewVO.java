package com.yourplace.custom.mypage.vo;

import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class MyPageGuestReviewVO {
	//예약 번호
	private String rsvNum;
	//유저 ID
	private String userId;
	// 장소 번호
	private int placeNum;
	// 리뷰 평점
	private int reviewGuestRate;
	// 리뷰 내용
	private String reviewGuestWr;
	// 리뷰 작성일
	private Date reviewGuestRegd;
}
