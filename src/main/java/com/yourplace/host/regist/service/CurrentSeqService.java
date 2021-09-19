package com.yourplace.host.regist.service;

public interface CurrentSeqService {
	//현재 장소 번호를 얻어온다.
	//세부방 정보 테이블, 이미지 테이블에 사용하기 위해서.
	int getCurSeq();
}
