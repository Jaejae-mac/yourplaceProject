package com.yourplace.custom.reservation.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {
	private String coupNum;
	private String userCoupId;
	private String userCoupUserYn;
	private Date coupStartD;
	private Date coupEndD;
	private String coupName;
	private int coupDisRate;
}
