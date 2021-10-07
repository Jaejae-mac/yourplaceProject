package com.yourplace.admin.coupon.all.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponAllVO {
	
	private String coupNum;
	private String coupName;
	private int coupDisRate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date coupStartD;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date coupEndD;

}
