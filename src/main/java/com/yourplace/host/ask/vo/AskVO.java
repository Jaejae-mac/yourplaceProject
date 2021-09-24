package com.yourplace.host.ask.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class AskVO {
	private int primaryKey; //seq
	private int reserveNum; //예약번호
	private String userId; //문의사항 아이디
	private String content; //내용
	private String doneYN; //처리완료여부
	
}
