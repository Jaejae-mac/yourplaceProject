package com.yourplace.custom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.custom.banner.service.AvailableBannerService;
import com.yourplace.custom.banner.vo.BannerVO;
import com.yourplace.custom.home.service.HomeGetLatestService;
import com.yourplace.custom.home.vo.PlaceCardVO;


@Controller
public class HomeController {
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private HomeGetLatestService homeGetLatestService;
	
	@Autowired
	private AvailableBannerService availableService;
	
	@GetMapping("/home.do")
	public String home(Model model) {
		
		List<PlaceCardVO> latestPlaces = homeGetLatestService.getLatestPlaceList();
		List<BannerVO> bannerVO = availableService.displayBanner();
		
		model.addAttribute("latestPlaces", latestPlaces);
		model.addAttribute("banner", bannerVO);
		
		return "index";
	}
	@GetMapping("/detail.do")
	public String detail() {
		return "index2";
	}
}
