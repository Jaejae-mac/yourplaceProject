package com.yourplace.host.review.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class HostReviewVO {
	private String reservNum;
	private String placeNum;
	private String memId;
	private int star;
	private Date regDate;
	private String review;
	

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
