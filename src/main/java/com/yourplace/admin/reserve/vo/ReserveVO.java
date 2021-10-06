package com.yourplace.admin.reserve.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveVO {
	
	private String rsvRefundYn;
	private int rsvNum;
	private int placeNum;
	
	private String userNum; //예약자 회원번호 -> 이걸로 id 조회
	private String userId; //호스트 아이디 조회

	private String rsvName; //예약자 이름
	private String rsvTel; //예약자 연락처
	
	private int rsvYear;
	private int rsvMonth;
	private int rsvDate;
	
	private String rsvPurpose;

}
