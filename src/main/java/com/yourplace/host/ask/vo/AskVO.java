package com.yourplace.host.ask.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class AskVO {
	private int primaryKey;
	private int reserveNum; //예약번호
	private String userId; //문의사항 아이디
	private String content; //내용
	private String doneYN;
	private int placeNum;
	private String placeName;
	
}
