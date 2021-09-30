package com.yourplace.host.management.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@Setter
public class HostManagementImgVO {

	private int placeNum;
	private String originFileName;
	private String s3FileName;
}
