package com.yourplace.host.sales.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class HostSalesVO {
	private String userId;
	private String placeName;
	private String paymentNum;
	private String reserveNum;
	private String reserveId;
	private String placeNum;
	private String mainCate;
	private String subCate;
	private String reserveName;
	private int payYear;
	private int payMonth;
	private int coupDisPercent;
	private int payDate;
	private int startTime;
	private int endTime;
	private int personNum;
	private int invCost;
	private int invBeforeTax;
	private int invTax;
	private int invAfterTax;
	private int userNum;
	private String couponNum;
	private String placeDetailNum;
	private String reserveDatee;
}
