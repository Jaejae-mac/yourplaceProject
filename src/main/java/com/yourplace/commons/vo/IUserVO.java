package com.yourplace.commons.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public interface IUserVO {
	public int getUserNum();
	public void setUserNum(int userNum);
	public int getUserType();
	public void setUserType(int userType);
	public String getUserName();
	public void setUserName(String userName);
	public String getUserNickName();
	public void setUserNickName(String userNickName);
	public String getUserId() ;
	public void setUserId(String userId);
	public String getUserPw() ;
	public void setUserPw(String userPw) ;
	public String getUserTel() ;
	public void setUserTel(String userTel) ;
	public String getUserEmail() ;
	public void setUserEmail(String userEmail) ;
	public String getUserSex() ;
	public void setUserSex(String userSex) ;
	public String getUserProfileImg() ;
	public void setUserProfileImg(String userProfileImg) ;
	public String getUserIntro() ;
	public void setUserIntro(String userIntro) ;
	public Date getUserRegDate() ;
	public void setUserRegDate(Date userRegDate) ;
	public String getUserSmsAgree() ;
	public void setUserSmsAgree(String userSmsAgree) ;
	public String getUserEmailAgree() ;
	public void setUserEmailAgree(String userEmailAgree) ;
	public String getKakaoId() ;
	public void setKakaoId(String kakaoId) ;
	public int getLoginCheck() ;
	public void setLoginCheck(int loginCheck) ;
	public String toString() ;
	public MultipartFile getProfile();
	public void setProfile(MultipartFile profile);
}
