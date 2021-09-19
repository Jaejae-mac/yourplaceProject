package com.yourplace.host.management.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class HostManagementVO {
	private int placeNum;
	private String userId;
	private String placeLocation;
	private String placeAddress;
	private String placeTag;
	private String placeMainCategory;
	private String placeCategory;
	private String placeName;
	private String placeIntro;
	private String placeArea;
	private String placeFloor;
	private String placeRule;
	private String placeSubInfo;
	private String placePrice;
	private String placeMinTime;
	private String placePersonNum;
	private String placeCarNum;
	private String placeExtraPrice; //할증
	private String placeThumbImg; //썸네일 경로
	private String placeAllow; //승인여부 0이 승인대기 1 승인
	private Date placeRegDate;
}
