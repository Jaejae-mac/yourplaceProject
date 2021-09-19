package com.yourplace.host.regist.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceDetailVO {
	private int placeNum;
	private String detailNum;
	private String detailTitle;
	private String defaultCapa;
	private String surcharge;
}
