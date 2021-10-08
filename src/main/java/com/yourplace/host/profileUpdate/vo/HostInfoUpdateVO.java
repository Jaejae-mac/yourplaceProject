package com.yourplace.host.profileUpdate.vo;

import org.springframework.stereotype.Component;

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
	private String userIntro;

}
