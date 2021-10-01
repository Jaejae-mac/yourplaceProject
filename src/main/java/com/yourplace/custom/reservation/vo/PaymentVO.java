package com.yourplace.custom.reservation.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	//예약번호
	private String rsvNum;
	//상품 결제 번호.
	private String payNum;
	//메인 카테고리.
	private String placeMaincate;
	//서브 카테고리.
	private String placeCate;
	//주문한 년.
	private int payYear;
	//주문한 월.
	private int payMonth;
	//주문한 일.
	private int payDate;
	//원가.
	private int invCost;
	//할인률.
	private int coupDisRate;
	//세전 금액.
	private int invBfTax;
	//부가세(수수료)
	private int invTax;
	//세후 금액.
	private int invAftTax;
	//유저 고유번호.
	private int userNum;
	//쿠폰 번호.
	private String payCoupNum;
	//상품 고유 번호.
	private String orderNum;
	
	private String rsvRefundReason;
	public PaymentVO() {
		rsvRefundReason = "not yet";
	}
}
