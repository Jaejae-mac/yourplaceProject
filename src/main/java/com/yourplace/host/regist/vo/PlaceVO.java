package com.yourplace.host.regist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceVO {
	//장소번호
	private int placeNum;
	//회원번호-호스트
	private String userId;
	//지역
	private String placeArea;
	//주소
	private String placeAddr;
	//태그
	private String placeTag = "#yourplace";
	//카테고리 - 대
	private String placeMaincate;
	//카테고리 - 소
	private String placeCate;
	//장소명
	private String placeName;
	//소개글
	private String placeIntro;
	//전용면적
	private String placeDa;
	//층
	private String placeFloor;
	//규칙
	private String placeRule;
	//주변정보
	private String placeSurinfo;
	//시간당 대여 금액
	private String placePrice;
	//최소 대여 시간
	private String placeMinTime;
	//기본 인원
	private String placeCapa;
	//주차 가능 차
	private String placeCapaCar;
	//할증
	private String placeExtrachrg;
	//이미지 저장 경로
	private String placeThumb;
	//승인여부. - 기본이 승인대기상태.
	private boolean placeAllow = false;
	//등록날짜.
	private Date placeRegDate;
	
}
