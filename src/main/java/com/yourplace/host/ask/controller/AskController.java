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
	public ModelAndView getAllAskForHost(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		List<AskVO> list = service.getMyAskList();
		System.out.println(list.toString());
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		mav.addObject("list", list);
		mav.addObject("userId", id);
		mav.setViewName("AskforHost");
		return mav;
	}
	
	
	
	@RequestMapping("/AskPopup.hdo")
	public ModelAndView popup()throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AskPopup");
		return mav;
	}
	
	@RequestMapping(value="/askHost.hdo", method=RequestMethod.POST)
	public void insertAsk(HttpServletRequest request, AskVO vo) throws Exception{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		String content = request.getParameter("content");
		System.out.println(id);
		System.out.println(content);
		
		
		
	}
	
}
