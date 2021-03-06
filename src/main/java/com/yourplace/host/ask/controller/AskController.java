package com.yourplace.host.ask.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.ask.service.AskService;
import com.yourplace.host.ask.vo.AskVO;

@Controller
public class AskController {

	@Inject
	private AskService service;
	
	@RequestMapping(value="/AskforHost.hdo")
	public ModelAndView getAllAskForHost(HttpServletRequest request, AskVO vo) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setUserId(id);
		List<AskVO> list = service.getMyAskList(vo);
		System.out.println(list.toString());
		List<AskVO> getMyPlace = service.getMyPlace(vo);

		mav.addObject("get", getMyPlace);
		mav.addObject("list", list);
		mav.addObject("userId", id);
		mav.setViewName("AskforHost");
		return mav;
	}
	

	
	
	
	@RequestMapping("/AskPopup.hdo")
	public ModelAndView popup(AskVO vo,HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		vo.setUserId(id);
		List<AskVO> getMyPlace = service.getMyPlace(vo);
		
		
		mav.addObject("get", getMyPlace);
		mav.setViewName("AskPopup");
		return mav;
	}
	
	@RequestMapping(value="/askHost.hdo", method=RequestMethod.POST) //중복 제거해야함
	public String insertAsk(HttpServletRequest request, AskVO vo) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		String content = request.getParameter("content");
		int placeNum = Integer.parseInt(request.getParameter("getPlaceNum"));

		
		vo.setUserId(id);
		vo.setPlaceNum(placeNum);
		vo.setContent(content);
		
		System.out.println(id);
		System.out.println(content);
		System.out.println(placeNum);
		
		service.insertAsk(vo);
		
		return "redirect:AskforHost.hdo";
		
		
	}
	
}
