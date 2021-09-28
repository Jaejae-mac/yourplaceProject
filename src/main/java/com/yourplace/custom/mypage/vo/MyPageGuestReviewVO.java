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
	private int rsvNum;
	private String userId;
	private int placeNum;
	private int reviewGuestRate;
	private String reviewGuestWr;
	private Date reviewGuestRegd;
}
