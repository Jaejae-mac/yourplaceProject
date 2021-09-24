package com.yourplace.admin.payment.vo;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	private int payRefundYn;
	private String payNum;
	private int payYear;
	private int payMonth;
	private int payDate;
	private int invBfTax;
	private int rsvNum;
	private int placeNum;
	private String rsvName;

}
