package com.yourplace.custom.mypage.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyPageReserveVO {
	private int placeNum;
	private String rsvId;
	private int rsvYear;
	private int rsvMonth;
	private int rsvDate;
	private int rsvStartT;
	private int rsvEndT;
	private int rsvRefundYn;
	private int rsvPay;
	private String userId;
	private String placeArea;
	private String placeName;
}
