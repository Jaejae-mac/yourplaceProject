package com.yourplace.custom.invoice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InvoiceVO {

	private String rsvNum; //예약 번호
	private String payNum; //결제 승인 번호
	private String placeMainCate; // 카테고리(대)
	private String placeCate; // 카테고리(소)
	private int payYear; // 거래일자 연
	private int payMonth; // 거래일자 월
	private int payDate; // 거래일자 일
	private int invCost; // 원가
	private int coupDisRate; // 할인율
	private int invTax; // 부가세(수수료)
	private int invAftTax; // 세후 금액
	private int userNum; // 회원 고유 번호 
	private int rsvRefundYn;
	private int refundCost;
	
	private String rsvName; // 예약자 명
	private int rsvYear; // 예약 년도
	private int rsvMonth; // 예약  월
	private int rsvDate; // 예약 일
	private String placeName; // 예약 장소명
	private int placeNum; // 예약 장소 번호 
	private int rsvStartT;
	private int rsvEndT;
}
