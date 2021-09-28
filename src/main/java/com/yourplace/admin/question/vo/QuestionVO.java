package com.yourplace.admin.question.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QuestionVO {

	private int reprtSeq;
	private int rsvNum;
	private String userId;
	private String reprtContent;
	private String reprtDoneYn;
	private int userType;
	private String userEmail;
	
}
