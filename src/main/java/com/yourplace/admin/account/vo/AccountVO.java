package com.yourplace.admin.account.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccountVO {

	private int adminNum;
	private int adminAuthority;
	private String adminId;
	private String adminPw;
	private String adminEmail;
	private String adminName;
	private String adminTel;
	private Date adminRegDate;
	
}
