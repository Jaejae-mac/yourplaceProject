package com.yourplace.custom.reservation.dao;

import java.util.List;

import com.yourplace.custom.reservation.vo.CouponVO;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reservation.vo.PaymentVO;
import com.yourplace.custom.reservation.vo.PlaceImgVO;
import com.yourplace.custom.reservation.vo.PlaceInfoVO;
import com.yourplace.custom.reservation.vo.ReviewVO;
import com.yourplace.custom.reservation.vo.RsvVO;



public interface RsvDAO {
	List<RsvVO> getReservation(RsvVO vo);
	DetailPlaceVO getDetailInfo(DetailPlaceVO vo);
	List<DetailPlaceVO> getDetailInfoList(DetailPlaceVO vo);
	PlaceInfoVO getPlaceInfo(PlaceInfoVO vo);
	List<PlaceImgVO> getImgList(PlaceImgVO vo);
	List<CouponVO> myCouponList(String userCoupId);
	void insertReservation(RsvVO vo);
	void userCouponStateUpdate(CouponVO vo);
	void insertPayment(PaymentVO vo);
	List<ReviewVO> reviewList(ReviewVO vo);
	void updateHelpCnt(ReviewVO vo);
	void insertClickedReview(ReviewVO vo);
	void deleteClickedReview(ReviewVO vo);
	ReviewVO getHelpCount(ReviewVO vo); 
	ReviewVO checkHelpBtnUser(ReviewVO vo);
	
}
