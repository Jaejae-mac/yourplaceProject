package com.yourplace.admin.question.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnswerVO {
	private int reprtSeqAns;
	private int reprtSeq;
	private String rsvNum;
	private int userType;
	private String userId;
	private String userEmail;
	private String reprtContentAns;
	private Date regDateAns;
	
	
	
	
}
 