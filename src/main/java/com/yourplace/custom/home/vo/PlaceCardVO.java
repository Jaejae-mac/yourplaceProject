package com.yourplace.custom.home.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceCardVO {
	//장소번호
	private int placeNum;
	//회원번호-호스트
	private String userId;
	//지역
	private String placeArea;
	//카테고리 - 대
	private String placeMaincate;
	//카테고리 - 소
	private String placeCate;
	//장소명
	private String placeName;
	//시간당 대여 금액
	private String placePrice;
	//기본 인원
	private String placeCapa;
	//주차 가능 차
	private String placeCapaCar;
	//이미지 저장 경로
	private String placeThumb;
	//평균 별점 (별4개, 별5개 등등)
	private String avgRate="0.0";
	//총리뷰 개수
	private String reviewCnt;
	//검색 단어
	private String keyword;
	private int placePeople;
	private int minPrice;
	private int maxPrice;
}

