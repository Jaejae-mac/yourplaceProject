package com.yourplace.custom.mypage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
public class MyPageCouponVO {
	// 쿠폰 번호
	private String userCoupNum;
	// 쿠폰보유자 ID
	private String userCoupId;
	// 쿠폰 사용여부
	private String userCoupUseYn;
	// 쿠폰 시작일
	private Date coupStartD;
	// 쿠폰 종료일
	private Date coupEndD;
	// 쿠폰 이름
	private String coupName;
	// 쿠폰 할인률
	private int coupDisRate;

}
