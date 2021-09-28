package com.yourplace.custom.reserve.vo;

import org.springframework.stereotype.Component;
import lombok.Getter;
import lombok.ToString;
import lombok.Setter;


@Getter
@Setter
@ToString
public class ReserveVO {
	private int placeNum;
	private String detailNum;
	private String rsvName;
	private String rsvId;
	private String rsvYear;
	private	String rsvMonth;
	private String rsvDate;
	private int rsvStartT;
	private int rsvEndTime;
	private String rsvPurpose;
	private String rsvRequest;
	private String rsvRefundYN;
	private String rsvRefundReason;
	private int rsvPay;
	private String rsvPayMthd;
	private int payYear;
	private int payMonth;
	private int payDate;
	private String payNum;
	private String payCoupYN;
	private String payCoupNum;
}


