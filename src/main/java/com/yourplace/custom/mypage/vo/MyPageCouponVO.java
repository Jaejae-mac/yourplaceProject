package com.yourplace.custom.mypage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
public class MyPageCouponVO {
	private int userCoupNum;
	private String userCoupId;
	private String userCoupUseYn;
	private Date userCoupStartD;
	private Date userCoupEndD;
	private String coupName;
	private int coupDisRate;

}
