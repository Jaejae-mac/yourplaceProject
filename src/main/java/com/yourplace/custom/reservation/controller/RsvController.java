package com.yourplace.custom.reservation.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yourplace.custom.reservation.service.GetDetailInfo;
import com.yourplace.custom.reservation.service.RsvGetReservationService;
import com.yourplace.custom.reservation.vo.DetailPlaceVO;
import com.yourplace.custom.reserve.vo.ReserveVO;

@RestController
public class RsvController {
	@Autowired
	private RsvGetReservationService rsvGetReservationService;
	@Autowired
	private GetDetailInfo getDetailInfo;

	//예약 시작, 종료 시간을 각각 분리하여 정렬한 후 보내주어야 한다.
	@PostMapping(value="/getReservation.do", consumes = "application/json", produces = "application/json")
	@CrossOrigin(origins="*")
	public List<ReserveVO> resReservation(@RequestBody ReserveVO vo) {
		System.out.println("장소 번호 : " + vo.getPlaceNum());
		System.out.println(vo.getRsvYear() + "-" + vo.getRsvMonth()+"-"+vo.getRsvDate() );
		List<ReserveVO> rsvList = rsvGetReservationService.getReservation(vo);
		System.out.println(rsvList);
		System.out.println("rsvList Len : " + rsvList.size());
		return rsvList;
	}
	
	@PostMapping(value="/getDetailInfo.do", consumes = "application/json", produces = "application/json")
	@CrossOrigin(origins="*")
	public DetailPlaceVO DetailInfo(@RequestBody DetailPlaceVO vo) {
		System.out.println(vo.toString());
		DetailPlaceVO info = getDetailInfo.getDetailInfo(vo);
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		if(!vo.getDetailNum().contains("default")) {
			int total = Integer.parseInt(info.getPlacePrice()) + Integer.parseInt(info.getSurcharge());
			String price = dc.format(Double.parseDouble(String.valueOf(total)));
			info.setTotalPrice(price);
		}else {
			String price = dc.format(Double.parseDouble(info.getPlacePrice()));
			info.setTotalPrice(price);
		}
		return info;
	}
}








