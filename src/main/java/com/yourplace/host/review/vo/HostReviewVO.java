package com.yourplace.host.review.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class HostReviewVO {
	private int reservNum; //예약번호
	private String placeNum; //장소번호
	private String memId; //호스트 아이디
	private int star; //별점
	private Date regDate; //날짜
	private String review; //리뷰 내용
	private String reserveId; //에약자 아이디
	

	/*
	   { title: "예약번호" },
          { title: "장소번호" },
          { title: "장소명" },
          { title: "회원아이디" },
          { title: "별점" },
          { title: "등록날짜" },
          { title: "리뷰보기" },
        ];
	 */
}
