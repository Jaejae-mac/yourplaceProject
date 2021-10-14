package com.yourplace.host.management.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.commons.awss3.AwsS3;
import com.yourplace.host.management.service.HostManagementDeleteService;
import com.yourplace.host.management.service.HostManagementRoomService;
import com.yourplace.host.management.service.HostManagementService;
import com.yourplace.host.management.vo.HostManagementImgVO;
import com.yourplace.host.management.vo.HostManagementRoomVO;
import com.yourplace.host.management.vo.HostManagementVO;
import com.yourplace.host.refund.vo.RefundVO;

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


   @RequestMapping(value = "/deletePlace.hdo", method = RequestMethod.POST)
   public String deletePlace(HttpServletRequest request, Map<String, Object> param, HostManagementVO vo) throws Exception {
      
      System.out.println(vo.getPlaceNum());
      int placeNum = vo.getPlaceNum();
      
      
      AwsS3 awsS3 = AwsS3.getInstance();

      vo.setPlaceNum(placeNum);
      List<HostManagementImgVO> getS3 = service3.getDeleteList(placeNum);
      System.out.println(getS3.size());
      System.out.println(getS3.toString());
   
         
      
      for(int i=0; i<getS3.size(); i++) {
         System.out.println(getS3.get(i).getOriginFileName());
         System.out.println("s3 ->");
         awsS3.delete(getS3.get(i).getS3FileName()); // 등록된 모든 key 확인하며 삭제
         service.deletePlace(placeNum);   
      
         
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
   
   @PostMapping("/getRoomVlaue.hdo")
   public String insertRoom(HttpServletRequest request, HostManagementRoomVO vo, Map<String, Object> param) throws Exception {
      HttpSession session = request.getSession();
      
      String userId = (String)session.getAttribute("userId");
      
      int placeNum = vo.getPlaceNum();
      String detailNum = vo.getDetailNum();
      String detailTitle = vo.getDetailTitle();
      String detatilPersonNum = vo.getDetailPersonNum();
      String surcharge = vo.getSurcharge();
      
      System.out.println(vo.toString());
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
      session.setAttribute("placeNum", placeNum);
      System.out.println(placeNum);
      List<HostManagementVO> getList = service.getOneHostPlace(vo);
      System.out.println(getList.toString());
      mav.addObject("updatePlace", getList);
      mav.setViewName("update");
      
      return mav;
        
   }
   

   @PostMapping("/updatepLace.hdo")
   public String getUpdatePlace(HttpServletRequest request, HostManagementVO vo, Map<String, Object> param)throws Exception {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("userId");
      int placeNum = (Integer) session.getAttribute("placeNum");
      vo.setPlaceNum(placeNum);
      System.out.println(vo.toString());
      service.updatePlace(placeNum, vo);
      session.removeAttribute("placeNum");
      return "redirect:/managementHostPlace.hdo";
   }

}