package com.yourplace.custom.reservation.dao;

import java.util.List;

import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;
import com.yourplace.custom.reserve.vo.ReserveVO;



public interface RsvDAO {
	List<ReserveVO> getReservation(ReserveVO vo);
	DetailPlaceVO getDetailInfo(DetailPlaceVO vo);
	List<DetailPlaceVO> getDetailInfoList(DetailPlaceVO vo);
	PlaceInfoVO getPlaceInfo(PlaceInfoVO vo);
	List<PlaceImgVO> getImgList(PlaceImgVO vo);
}
