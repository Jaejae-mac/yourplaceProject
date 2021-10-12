package com.yourplace.admin.revenue.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class RevenueVO {
	
	private String rsvNum;
	private String payNum;
	private String placeMaincate;
	private String placeCate;
	private int payYear;
	private int payMonth;
	private int payDate;
	private int rsvRefundYn;

	private int invCost;
	private int coupDisRate;
	private int invBfTax;
	private int invTax;
	private int invAftTax;
	private int userNum;

	private int revenue;
	private int cnt;
	private double result;
	
	private String year;
	private String payStartMonth;
	private String payEndMonth;
	private String payStartDate;
	private String payEndDate;

	
}
