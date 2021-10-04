package com.yourplace.custom.reservation.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	//RowNum
	private int rowNum;
	//예약번호.
	private String rsvNum;
	//유저아이디.
	private String userId;
	//장소번호.
	private int placeNum;
	//리뷰 별 개수.
	private int reviewGuestRate;
	//리뷰 게스트콘텐츠
	private String reviewGuestWr;
	//리뷰 등록 날짜.
	private String reviewGuestRegd;
	//도움되요 버튼 클릭 수.
	private int helpCnt;
	private String userNickName;
	//0이면 오래된 리뷰 순을 정렬. 최신순 클릭시 0일경우 1로변경해야한다.
	//1이면 최신 리뷰순으로 정렬해서 최신순 클릭시 1일 경우 0으로 변경해야 한다.
	//2이면 helpCnt 많은 순을 정렬해서 보여준다. 추천순 클릭시 2가 아니면 2로 변경해야하고.
	//2이면 0으로 변경해야한다.
	private int orderFlag = 0;
	
	int lastRowNum = 5;
	//리뷰 더보기 버튼 활성화여부.
	boolean reviewMoreBtn;

}
