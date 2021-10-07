package com.yourplace.host.management.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.host.management.service.HostManagementDeleteService;
import com.yourplace.host.management.service.HostManagementRoomService;
import com.yourplace.host.management.service.HostManagementService;
import com.yourplace.host.management.vo.HostManagementImgVO;
import com.yourplace.host.management.vo.HostManagementRoomVO;
import com.yourplace.host.management.vo.HostManagementVO;

@Controller
public class HostManagementController {
	
	@Inject
	HostManagementService service;
	
	@Inject
	HostManagementRoomService service2;
	
	@Inject
	HostManagementDeleteService service3;

	
	@RequestMapping(value="/managementHostPlace.hdo")
	public ModelAndView allPlace(HttpServletRequest request, HostManagementVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		List<HostManagementVO> list = service.getAllHostPlace(vo);
		mav.setViewName("managementHostPlace");
		mav.addObject("list", list);
		mav.addObject("userId", userId);
		System.out.println(userId);
		return mav;
	}
	

	@RequestMapping(value="/deleteRoom.hdo", method=RequestMethod.GET)
	public String deleteRoom(HttpServletRequest request, HostManagementRoomVO vo, @RequestParam("detailNum")String detailNum) throws Exception{
	
		System.out.println(detailNum + "방 이름");
		service2.deleteRoom(detailNum);
		
		return "redirect:/managementHostRoomPlace.hdo";
	}


	@RequestMapping(value = "/deletePlace.hdo", method = RequestMethod.GET)
	public String deletePlace(HttpServletRequest request, @RequestParam("placeNum")int placeNum) throws Exception {
		
		System.out.println(placeNum + "번 장소");
		
		AwsS3 awsS3 = AwsS3.getInstance();

		
		List<HostManagementImgVO> getS3 = service3.getDeleteList(placeNum);
		System.out.println(getS3.size());
		System.out.println(getS3.toString());
		try {
			
		
		for(int i=0; i<=getS3.size(); i++) {
			System.out.println(getS3.get(i).getOriginFileName());
			System.out.println("s3 ->");
			awsS3.delete(getS3.get(i).getS3FileName()); // 등록된 모든 key 확인하며 삭제
			service.deletePlace(placeNum);
		}
		}catch(Exception e) {
			
		}
		return "redirect:/managementHostPlace.hdo";
	}
	
	@RequestMapping(value="/insertPlaceforHost.hdo")
	public ModelAndView insertPlaceView(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("userId");
		mav.setViewName("insertPlaceforHost");
		mav.addObject("userId", id);
		return mav;
	}
	
	//방 등록 수정해야함
	
	@RequestMapping(value="/managementHostRoomPlace.hdo", method=RequestMethod.GET)
	public ModelAndView getRoom(HttpServletRequest request, HostManagementRoomVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);

		List<HostManagementRoomVO> roomlist = service2.getRoomList(vo);
		
		System.out.println(roomlist);
		
		System.out.println(roomlist.toString());
		mav.addObject("userId", userId);
		mav.addObject("list2", roomlist);
		mav.setViewName("managementHostRoomPlace");
		return mav;
	}
	
	@GetMapping("/getRoomVlaue.hdo")
	public String insertRoom(HttpServletRequest request, HostManagementRoomVO vo) throws Exception {
		HttpSession session = request.getSession();
		
		String placeNum = request.getParameter("pNum");
		String detailNum = request.getParameter("roomNum");
		String roomname = request.getParameter("detailTitle"); //방 이름
		String roomPer = request.getParameter("detailPersonNum"); //인원수
		String extra = request.getParameter("surcharge"); //할증
		
		System.out.println(placeNum);
		System.out.println(detailNum);
		System.out.println(roomname);
		System.out.println(roomPer);
		System.out.println(extra);
		
		vo.setDetailNum(detailNum);
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		
		service2.insertRoom(vo);
		
		return "redirect:/managementHostRoomPlace.hdo";

	}
	
	
	@RequestMapping(value="/updatePlaceDetail.hdo", method=RequestMethod.GET)
	public ModelAndView updatePlaceDetail(HttpServletRequest request, HostManagementVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String userId= (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
		int placeNum = Integer.parseInt(request.getParameter("placeNum"));
		vo.setPlaceNum(placeNum);
		System.out.println(placeNum);
		List<HostManagementVO> getList = service.getOneHostPlace(vo);
		
		
		System.out.println(getList.toString());
		mav.addObject("updatePlace", getList);
		mav.setViewName("update");
		return mav;
		
	}

	
	@PostMapping("/updatepLace.hdo")
	public String getUpdatePlace(HttpServletRequest request, HostManagementVO vo) throws Exception{
		String placeName = (String) request.getParameter("placeName");
		
		String hashList = request.getParameter("tag");
		
		try {
			for(int i=0; i<=hashList.length(); i++)
				System.out.println("해시태그:" + hashList);
		}catch(Exception e) {
			
		}
		
		String placeIntro = (String)request.getParameter("placeIntro");  //장소소개
		String placeArea = (String)request.getParameter("placeArea"); //평수
		String placeFloor = (String)request.getParameter("placeFloor"); //층
		String placeRule = (String)request.getParameter("placeRule"); //규칙
		
		String placePrice = (String)request.getParameter("placePrice"); //가격
		String placeMinTime = (String) request.getParameter("placeMinTime"); //최소대여시간
		String placeCarNum = (String)request.getParameter("placeCarNum"); //주차 가능 수
		
		String placePersonNum = (String)request.getParameter("placePersonNum"); //최소인원
		String placeSubInfo = (String)request.getParameter("placeSubInfo"); //주변정보
		
		int placeNum = Integer.parseInt(request.getParameter("placeNum"));
		
		System.out.println("장소 이름 :" + placeName);
		System.out.println("장소 소개 :" + placeIntro);
		System.out.println("장소 전용면적" + placeArea);
		System.out.println("장소 층 :" + placeFloor);
		System.out.println("장소 규칙 : " + placeRule);
		System.out.println("가격 :" + placePrice );
		System.out.println("최소 대여 시간 : " + placeMinTime);
		System.out.println("주차가능 대수:" + placeCarNum);
		System.out.println("인원" + placePersonNum);
		System.out.println("장소 주변 :" + placeSubInfo);
		
		//평수 계산
		double m2 = 3.305;
		BigDecimal a = new BigDecimal(String.valueOf(placeArea));
		BigDecimal c = new BigDecimal(String.valueOf(m2));
		
		BigDecimal m2math= c.multiply(a);
		System.out.println(m2math);
	
		//끝
		vo.setPlaceName(placeName);
		vo.setPlaceArea(placeArea +"평" + "/"+ m2math + "m2");
		vo.setPlaceFloor(placeFloor);
		vo.setPlaceIntro(placeIntro);
		vo.setPlaceRule(placeRule);
		vo.setPlacePrice(placePrice);
		vo.setPlaceMinTime(placeMinTime);
		vo.setPlacePersonNum(placePersonNum);
		vo.setPlaceCarNum(placeCarNum);
		vo.setPlaceSubInfo(placeSubInfo);
		vo.setPlaceNum(placeNum);

		service.updatePlace(placeNum, vo);
		
		return "redirect:/managementHostPlace.hdo";
	}

	

}
