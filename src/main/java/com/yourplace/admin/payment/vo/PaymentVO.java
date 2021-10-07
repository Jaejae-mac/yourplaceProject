package com.yourplace.admin.payment.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	private int rsvRefundYn;
	private String orderNum;
	private String payNum;
	private int payYear;
	private int payMonth;
	private int payDate;
	private int invBfTax;
	private String rsvNum;
	private int placeNum;
	private String rsvName;

	private int userNum;
	private String userId;
	private String rsvRefundReason;
	
	private Date refundDate;
	private String payCoupNum;
	private int refundCost;
	
	private int coupDisRate;
	
}
