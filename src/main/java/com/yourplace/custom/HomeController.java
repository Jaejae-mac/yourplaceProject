package com.yourplace.custom;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.commons.vo.IUserVO;
import com.yourplace.custom.home.service.HomeGetLatestService;
import com.yourplace.custom.home.vo.PlaceCardVO;
import com.yourplace.custom.interest.service.BookmarkListService;
import com.yourplace.custom.interest.vo.InterestVO;
import com.yourplace.custom.login.vo.UserVO;
import com.yourplace.host.login.vo.HostVO;


@Controller
public class HomeController {
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private HomeGetLatestService homeGetLatestService;
	@Autowired
	private BookmarkListService bookmarkListService;
	
	@GetMapping("/home.do")
	public String home(Model model,HttpSession session) {
		List<PlaceCardVO> latestPlaces = homeGetLatestService.getLatestPlaceList();
		List<InterestVO> bookmarks = null;
		
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
					}else {
						card.setBookmark(false);
					}
				}
			}
		}
		model.addAttribute("latestPlaces", latestPlaces);
		return "index";
	}
	@GetMapping("/detail.do")
	public String detail() {
		return "index2";
	}
}
