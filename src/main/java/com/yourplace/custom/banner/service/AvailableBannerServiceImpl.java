package com.yourplace.custom.banner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.banner.dao.BannerDAO;
import com.yourplace.custom.banner.vo.BannerVO;

@Service("availableService")
public class AvailableBannerServiceImpl implements AvailableBannerService {

	@Autowired
	private BannerDAO bannerdao;
	
	@Override
	public List<BannerVO> displayBanner() {
		System.out.println("[Service] Custom - 공개된 배너 이미지가 home 에 display");
		return bannerdao.displayBanner();
	}

}
