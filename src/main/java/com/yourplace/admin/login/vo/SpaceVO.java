package com.yourplace.admin.login.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SpaceVO {

	private int placeNum;
	private String userId;
	private String userName;
	private String placeName;
	private String placeMaincate;
	private String userTel;
	private String userEmail;
	private String placeAllow;
	private String placeThumb;
	private String s3FileName;
	private Date placeRegDate;
	private String placeArea;
	private int rsvRefundYn;
	
}
