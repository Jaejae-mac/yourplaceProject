package com.yourplace.host.chart.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HostChartVO {
	private String userId;
	private String mainCategory;
	private String placeCategory;
	private String payYear;
	private String payMonth;
	private String payDate;
	private String AfterTax;
	private String invTax;
	private String reserveYear;
	private String reserveMonth;
	private String reserveDate;
	private String startTime;
	private String endTime;
	private String placeName;
	private String AfterReview;

}
