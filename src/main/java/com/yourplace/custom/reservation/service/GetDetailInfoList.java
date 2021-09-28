package com.yourplace.custom.reservation.service;

import java.util.List;

import com.yourplace.custom.reservation.vo.DetailPlaceVO;

public interface GetDetailInfoList {
	List<DetailPlaceVO> getDetailInfo(DetailPlaceVO vo);
}
