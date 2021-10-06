package com.yourplace.custom.interest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yourplace.custom.interest.service.BookmarkService;
import com.yourplace.custom.interest.vo.InterestVO;

@RestController
public class BookmarkController {
	@Autowired
	private BookmarkService bookmarkService;
	@GetMapping("/bookmark.do")
	public String bookmark(
			@RequestParam("userId") String userId,
			@RequestParam("placeNum") String placeNum
			) 
	{
		
		InterestVO vo = new InterestVO();
		vo.setPlaceNum(Integer.parseInt(placeNum));
		vo.setUserId(userId);
		int rst = bookmarkService.bookmark(vo);
		String returnRst = "";
		//0이면 북마크 제거하고 돌아오는중임.
		if(rst == 0) {
			returnRst = "removeBookmark";
		}
		//1이면 북마크 추가하고오는 길임.
		else {
			returnRst = "addBookmark";
		}
		return returnRst;
	}
}
