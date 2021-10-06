package com.yourplace.admin.coupon.user.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponUserVO {
	
	private String coupNum;
	//private int userCoupNum;
	//private String userCoupName;
	private String userCoupId;
	//private int userCoupDisRate;
	private String userCoupUseYn;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date coupStartD;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date coupEndD;

}
