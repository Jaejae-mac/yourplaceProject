package com.yourplace.custom.login.vo;

import java.sql.Date;

import com.yourplace.commons.vo.IUserVO;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO  implements IUserVO {
	private int userNum;
	private int userType;
	private String userName;
	private String userNickName;
	private String userId;
	private String userPw;
	private String userTel;
	private String userEmail;
	private String userSex;
	private String userProfileImg;
	private String userIntro;
	private Date userRegDate;
	private String userSmsAgree;
	private String userEmailAgree;
	private String kakaoId;
	private int loginCheck; // 1이면 로그인, 0이면 아이디또는 비번 틀림.
	private MultipartFile profile;
	
	
	
}
