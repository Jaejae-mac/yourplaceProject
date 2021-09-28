package com.yourplace.custom.reservation.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DetailPlaceVO {
	private int placeNum;
	private String detailNum;
	private String detailTitle;
	private String defaultCapa;
	private String surcharge;
	private String placePrice;
	private String totalPrice;
}
