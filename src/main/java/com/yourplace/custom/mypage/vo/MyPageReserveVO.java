package com.yourplace.custom.mypage.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyPageReserveVO {
	private int placeNum;
	private int userNum;
	private String rsvNum;
	private int rsvYear;
	private int rsvMonth;
	private int rsvDate;
	private int rsvStartT;
	private int rsvEndT;
	private int rsvRefundYn;
	private int invBfTax;
	private String userId;
	private String placeArea;
	private String placeName;
	private String placeThumb;
	private String rsvReviewYn;
	private String searchKeyword;
}
