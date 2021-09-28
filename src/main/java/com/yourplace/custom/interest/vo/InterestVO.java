package com.yourplace.custom.interest.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InterestVO {

	private String userId; //유저 아이디
	
	private int placeNum; //장소 번호
	private String placeThumb; // 장소 썸네일
	private String placeName; // 장소 제목
	
}
