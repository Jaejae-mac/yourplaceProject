package com.yourplace.custom;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.commons.vo.IUserVO;
import com.yourplace.custom.banner.service.AvailableBannerService;
import com.yourplace.custom.banner.vo.BannerVO;

import com.yourplace.custom.home.service.HomeGetLatestService;
import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.interest.service.BookmarkListService;
import com.yourplace.custom.interest.vo.InterestVO;



@Controller
public class HomeController {
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private HomeGetLatestService homeGetLatestService;
	@Autowired
	private BookmarkListService bookmarkListService;
	
	@Autowired
	private AvailableBannerService availableService;
	
	@Autowired
	private HomeGetLatestService homeGetPolularService;
	
	@GetMapping("/home.do")
	public String home(Model model,HttpSession session, @RequestParam(value="welcomeCoupon", required = false) String welcomeCoupon,
			@RequestParam(value="hostAccessDenied", required = false) String hostAccessDenied) {
		List<PlaceCardVO> latestPlaces = homeGetLatestService.getLatestPlaceList();
		List<PlaceCardVO> latestPlacesModel = new ArrayList<PlaceCardVO>();
		List<PlaceCardVO> popularPlaces = homeGetPolularService.getLatestPlaceList();
		List<PlaceCardVO> popularPlacesModel = new ArrayList<PlaceCardVO>();
		//북마크.
		List<InterestVO> bookmarks = null;
		//배너 리스트 불러오기.
		List<BannerVO> bannerVO = availableService.displayBanner();
		System.out.println(welcomeCoupon);
		//로그인한 이력이 존재한다면.
		if(session.getAttribute("userVO") != null) {
			InterestVO vo = new InterestVO();
			IUserVO iuvo = (IUserVO)session.getAttribute("userVO");
			String userId = iuvo.getUserId();
			vo.setUserId(userId);
			bookmarks = bookmarkListService.bookmarkList(vo);
			
			for(PlaceCardVO card : latestPlaces) {
				for(InterestVO bookmark : bookmarks) {
					if(card.getPlaceNum() == bookmark.getPlaceNum()) {
						card.setBookmark(true);
						break;
					}else {
						card.setBookmark(false);
					}
				}
				latestPlacesModel.add(card);
			}
			for(PlaceCardVO card : popularPlaces) {
				for(InterestVO bookmark : bookmarks) {
					if(card.getPlaceNum() == bookmark.getPlaceNum()) {
						card.setBookmark(true);
						break;
					}else {
						card.setBookmark(false);
					}
				}
				popularPlacesModel.add(card);
			}
		}else {
			latestPlacesModel = latestPlaces;
			popularPlacesModel = popularPlaces;
		}
		System.out.println(latestPlacesModel.toString());
		if(welcomeCoupon != null) {
			model.addAttribute("welcomeCoupon", welcomeCoupon);
		}
		if(hostAccessDenied != null) {
			model.addAttribute("hostAccessDenied", "hostAccessDenied");
		}
		model.addAttribute("latestPlaces", latestPlacesModel);
		model.addAttribute("banner", bannerVO);
		model.addAttribute("popularPlaces", popularPlacesModel);
		
		return "index";
	}
	@GetMapping("/detail.do")
	public String detail() {
		return "index2";
	}
}
