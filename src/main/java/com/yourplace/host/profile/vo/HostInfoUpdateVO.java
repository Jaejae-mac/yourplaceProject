package com.yourplace.host.profile.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component

public class HostInfoUpdateVO {
	private String userNickName;
	private String userId;
	private String userEmail;
	private MultipartFile userProfileImg;
	private String userIntro;
	private String imgUrl;
}
