package com.yourplace.custom.mypage.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyPageReserveVO {
	// 장소 번호
	private int placeNum;
	// 유저 번호
	private int userNum;
	// 예약 번호
	private String rsvNum;
	// 예약 년도
	private int rsvYear;
	// 예약 달
	private int rsvMonth;
	// 예약 일
	private int rsvDate;
	// 예약 시작 시간
	private int rsvStartT;
	// 예약 종료 시간
	private int rsvEndT;
	// 환불 여부
	private int rsvRefundYn;
	// 대여 가격
	private int invBfTax;
	// 호스트 아이디
	private String userId;
	// 예약 장소지역
	private String placeArea;
	// 예약 장소이림
	private String placeName;
	// 예약 장소이미지
	private String placeThumb;
	// 예약 리뷰여부
	private String rsvReviewYn;
	// 검색어
	private String searchKeyword;
}
