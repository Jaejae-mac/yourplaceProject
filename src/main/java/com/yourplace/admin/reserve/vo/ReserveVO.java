package com.yourplace.admin.reserve.vo;

import java.sql.Timestamp;
import java.time.OffsetDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveVO {
	
	private String rsvRefundYn;
	private int placeNum;
	private String userId;
	private int rsvNum;
	private String rsvId;
	private String rsvTel;
	private int rsvYear;
	private int rsvMonth;
	private int rsvDate;	
	private String rsvPurpose;

}
