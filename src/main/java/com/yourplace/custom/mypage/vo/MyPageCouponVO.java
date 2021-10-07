package com.yourplace.custom.mypage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
public class MyPageCouponVO {
	private String userCoupNum;
	private String userCoupId;
	private String userCoupUseYn;
	private Date coupStartD;
	private Date coupEndD;
	private String coupName;
	private int coupDisRate;

}
