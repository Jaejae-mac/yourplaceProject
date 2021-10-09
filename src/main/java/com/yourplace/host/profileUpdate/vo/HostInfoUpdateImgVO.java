package com.yourplace.host.profileUpdate.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class HostInfoUpdateImgVO {
	private MultipartFile userProfileImg;
	private String imgUrl;
	private String userId;
}
