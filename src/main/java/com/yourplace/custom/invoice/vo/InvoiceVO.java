package com.yourplace.custom.invoice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InvoiceVO {

	private int rsvNum; //예약 번호
	private int payYear; //결제 연도
	private int payMonth; //결제 월
	private int payDate; // 결제 일
	private String rsvName; // 예약자 이름
	private int placeNum; // 장소 번호 
//	private String placeName; // 예약 장소 명
	private int rsvYear; // 예약 연도
	private int rsvMonth; // 예약 월
	private int rsvDate; // 예약일
//	private Time rsvStartT; // 예약기간의 시작시각
	private int rsvPay; // 결제 금액
//	private int 총 금액 
}
