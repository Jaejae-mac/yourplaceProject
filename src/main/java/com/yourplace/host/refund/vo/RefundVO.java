package com.yourplace.host.refund.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@Setter
public class RefundVO {
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

}
