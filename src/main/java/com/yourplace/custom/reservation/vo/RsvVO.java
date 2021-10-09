package com.yourplace.custom.reservation.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RsvVO {
	private int placeNum;
	private String detailNum;
	private String placeDetailNum;
	private int userNum;
	private String rsvName;
	// 예약번호.
	private String rsvNum;
	private String rsvYear;
	private String rsvMonth;
	private String rsvDate;
	private int rsvStartT;
	private int rsvEndT;
	private String rsvPurpose;
	private String rsvRequest;
	private String rsvEmail;
	private String rsvTel;
	// 결제금액.
	private int invBfTax;
	private int payYear;
	private int payMonth;
	private int payDate;
	private String payCoupNum = "none";
	//쿠폰 이름.
	private String coupName;
	// 프론트에서 계산된 총 결제 가격.
	private String rstPrice;
	// 사용자 입력 인원 수
	private int headCount;
	private String detailTitle;
	private String hostNickName;
	private String userId;
	private String placeName;
	private String placePrice;

	// 카드 승인 번호.
	private String payNum;
	// 상품 아이디.
	private String orderNum;
	private int coupDisRate;
	// 메인 카테고리.
	private String placeMaincate;
	// 서브 카테고리.
	private String placeCate;
	//썸네일 경로.
	private String placeThumb;
	//결제완료창에 보여질 예약시간 및 날짜.
	private String reservationDate;
	private String reservationTime;
}
