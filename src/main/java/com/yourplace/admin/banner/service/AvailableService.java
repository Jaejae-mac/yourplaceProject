package com.yourplace.admin.banner.service;

import java.util.List;

import com.yourplace.admin.banner.vo.BannerVO;

public interface AvailableService {

	//상태 조회
	int availableBanner(String bannerNum);
	
	//update to "able"
	void ableBanner(String bannerNum);
	
	//update to "disable"
	void disableBanner(String bannerNum);
	
}
