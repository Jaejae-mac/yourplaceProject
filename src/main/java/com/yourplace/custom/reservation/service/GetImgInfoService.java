package com.yourplace.custom.reservation.service;

import java.util.List;

import com.yourplace.custom.reservation.vo.PlaceImgVO;

public interface GetImgInfoService {
	List<PlaceImgVO> getImgInfo(int placeNum);
}
