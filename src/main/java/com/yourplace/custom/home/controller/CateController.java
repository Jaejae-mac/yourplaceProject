package com.yourplace.custom.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.custom.home.service.CategoryService;
import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.interest.service.BookmarkListService;
import com.yourplace.custom.interest.vo.InterestVO;
import com.yourplace.custom.login.vo.UserVO;

@Controller
public class CateController {
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BookmarkListService bookmarkListService;
	
	@GetMapping("/category.do")
	public String categoryForm(@RequestParam String maincate, @RequestParam String subcate, Model model,HttpSession session) {
		List<PlaceCardVO> list = categoryService.getCatePlace(maincate, subcate);
		List<InterestVO> bookmarks = null;
		if(session.getAttribute("userVO") != null) {
			InterestVO vo = new InterestVO();
			String userId = ((UserVO)session.getAttribute("userVO")).getUserId();
			vo.setUserId(userId);
			bookmarks = bookmarkListService.bookmarkList(vo);
			for(PlaceCardVO card : list) {
				for(InterestVO bookmark : bookmarks) {
					if(card.getPlaceNum() == bookmark.getPlaceNum()) {
						card.setBookmark(true);
					}else {
						card.setBookmark(false);
					}
				}
			}
		}
		String[][] menuList = {
								{"가정집", "아파트", "주택", "빌라", "원룸", "한옥", "홈오피스" },
								{"스튜디오", "자연광", "호리존", "유튜브", "단독주택형", "빈티지", "키친",
									"무대형", "세트장", "무인", "녹음실", "연습실", "파티룸" },
								{"상업공간", "카페", "식당", "바/술집", "헬스장", "요가/필라테스" },
								{ "편의시설", "편의점", "빨래방", "헤어샵", "PC방", "노래방", "오락실","스포츠"},
								{ "문화공간", "복합문화공간", "갤러리", "공방/작업실", "책방", "공연장", "강당","강의실" },
								{"특수공간",  "사무실", "병원/약국", "학교", "학원", "클럽", "웨딩", "호텔펜션"},
								{"대형공간/야외", "공장", "창고", "지하실", "빈 공간", "옥상", "정원", "캠핑장"},
								};
		if(list != null) {
			model.addAttribute("placeCateList", list);
			model.addAttribute("mainCategory",maincate);
			switch(maincate) {
			case "가정집":
				model.addAttribute("categoryList", menuList[0]);
				break;
			case "스튜디오":
				model.addAttribute("categoryList", menuList[1]);
				break;
			case "상업공간":
				model.addAttribute("categoryList", menuList[2]);
				break;
			case "편의시설":
				model.addAttribute("categoryList", menuList[3]);
				break;
			case "문화공간":
				model.addAttribute("categoryList", menuList[4]);
				break;
			case "특수공간":
				model.addAttribute("categoryList", menuList[5]);
				break;
			case "대형공간/야외":
				model.addAttribute("categoryList", menuList[6]);
				break;
			}
		}
		System.out.println(maincate);
		System.out.println(subcate);
		return "indexCategory";
	}
}
