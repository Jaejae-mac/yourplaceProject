package com.yourplace.admin.banner.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BannerVO {

	private int bannerNum;
	private String originalFileName;
	private String s3FileName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fileRegDate;
	
}
