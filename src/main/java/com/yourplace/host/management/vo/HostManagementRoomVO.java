package com.yourplace.host.management.vo;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class HostManagementRoomVO {
	private int placeNum;
	private String detailNum;
	private String detailTitle;
	private String detailPersonNum;
	private String surcharge;
	private String userId;
}
