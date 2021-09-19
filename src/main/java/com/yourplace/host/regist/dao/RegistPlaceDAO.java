package com.yourplace.host.regist.dao;

import com.yourplace.host.regist.vo.PlaceDetailVO;
import com.yourplace.host.regist.vo.PlaceImgVO;
import com.yourplace.host.regist.vo.PlaceVO;

public interface RegistPlaceDAO {
	int getCurSeq();
	void setPlaceDetail(PlaceDetailVO vo);
	void setPlaceImg(PlaceImgVO vo);
	void setPlace(PlaceVO vo);
	void updateThumb(PlaceVO vo);
}
