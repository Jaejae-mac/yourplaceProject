package com.yourplace.host.reserv.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class HostReservVO {
	private String userId;
	private String placeName;
	private String reserveNum;
	private String reserveId;
	private String placeNum;
	private String reserveName;
	private int reserveYear;
	private int reserveMonth;
	private int reserveDate;
	private int startTime;
	private int endTime;
	private int personNum;
	private int payPrice;
	private int userNum;
	private String reservePurpose;
	private String reserveRequest;
	private String reserveReviewYN;
	private String couponNum;
	private String reserveTel;
	private String placeDetailNum;
	private String reserveDatee;
}
