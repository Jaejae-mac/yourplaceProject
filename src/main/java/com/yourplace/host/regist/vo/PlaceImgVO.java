package com.yourplace.host.regist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceImgVO {
	private int imgNum;
	private int placeNum;
	private String originalFileName;
	private String s3FileName;
	private Date imgRegDate;
}
