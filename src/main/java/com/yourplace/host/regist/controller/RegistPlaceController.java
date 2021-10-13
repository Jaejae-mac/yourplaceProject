package com.yourplace.host.regist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yourplace.host.regist.service.CurrentSeqService;
import com.yourplace.host.regist.service.PlaceDetailService;
import com.yourplace.host.regist.service.RegistPlaceService;
import com.yourplace.host.regist.service.UploadFileService;
import com.yourplace.host.regist.vo.PlaceDetailVO;
import com.yourplace.host.regist.vo.PlaceVO;

@Controller
public class RegistPlaceController {
	@Autowired
	private UploadFileService uploadFileService;

	@Autowired
	private CurrentSeqService currentSeqService;
	
	@Autowired
	private PlaceDetailService placeDetailService;
	
	@Autowired
	private RegistPlaceService registPlaceService;

	@GetMapping("/regist/place/form.hdo")
	public String regitstPlaceForm() {
		System.out.println("GET/ registForm - host");
		return "registplace/registPlaceForm";
	}

	@PostMapping("/regist/place/registPlace.hdo")
	public String registPlace(MultipartHttpServletRequest mtfRequest, PlaceVO vo,
			@RequestParam(value = "roomTitle", required = false) List<String> roomTitle,
			@RequestParam(value = "defaultCapa", required = false) List<String> defaultCapa,
			@RequestParam(value = "surcharge", required = false) List<String> surcharge, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		vo.setUserId(String.valueOf(session.getAttribute("userId")));
		vo.setPlaceThumb("NOT YET");
		if (roomTitle != null) {
			// 상세 방번호는 장소번호 + "a" 이런식으로 이어간다.
			registPlaceAck(mtfRequest, vo, roomTitle, defaultCapa, surcharge);
		} else {
			registPlaceAck(mtfRequest, vo);
		}
		return "redirect:/regist/place/form.hdo";
	}
	
	
	// 동시성 제어. - 세부 방 정보를 스킵한 유저라면 해당 메서드 호출.
	public synchronized String registPlaceAck(MultipartHttpServletRequest mtfRequest, PlaceVO vo) {
		String placeTitle = vo.getPlaceName();
		int seq = currentSeqService.getCurSeq();
		registPlaceService.registPlace(vo);
		uploadFileService.upload(mtfRequest, vo.getUserId(),seq,vo.getPlaceCate(), placeTitle);
		registPlaceDetail(vo, null, null, null,seq);
		return null;
	}

	// 동시성 제어.- 세부 방 정보를 등록한 유저라면 해당 메서드 호출.
	public synchronized String registPlaceAck(MultipartHttpServletRequest mtfRequest, PlaceVO vo,
		List<String> roomTitle, List<String> defaultCapa, List<String> surcharge) {
		String placeTitle = vo.getPlaceName();
		int seq = currentSeqService.getCurSeq();
		registPlaceService.registPlace(vo);
		uploadFileService.upload(mtfRequest, vo.getUserId(),seq,vo.getPlaceCate(), placeTitle);
		registPlaceDetail(vo, roomTitle, defaultCapa, surcharge,seq);
		return null;
	}

	// 세부 방 정보를 DB에 등록시킬 컨트롤러의 메서드.
	public void registPlaceDetail(PlaceVO vo,List<String> roomTitle, List<String> defaultCapa, List<String> surcharge,int curSeq) {
		PlaceDetailVO detail =  null;
		detail = new PlaceDetailVO();
		detail.setDetailTitle("기본");
		detail.setSurcharge("0");
		detail.setDetailNum("default"+curSeq);
		detail.setDefaultCapa(vo.getPlaceCapa());
		
		placeDetailService.setPlaceDetail(detail);
		System.out.println(detail.getDetailTitle() + " 의 방을 DB에 등록했습니다.");
		if(roomTitle != null) {
			for(int i = 0 ; i < roomTitle.size(); i ++) {
				detail = new PlaceDetailVO();
				detail.setDetailNum(curSeq+Character.toString((char)(i+65)));
				detail.setDetailTitle(roomTitle.get(i));
				detail.setDefaultCapa(defaultCapa.get(i));
				detail.setSurcharge(surcharge.get(i));
				placeDetailService.setPlaceDetail(detail);
				System.out.println(detail.getDetailTitle() + " 의 방을 DB에 등록했습니다.");
			}
		}
	}
}
