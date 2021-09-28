package com.yourplace.custom.mypage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MyPageHostReviewVO {
	private int rsvNum;
	private String rsvId;
	private String userId;
	private int placeNum;
	private int reviewGuestRate;
	private String reviewGuestWr;
	private Date reviewGuestRegd;
}
