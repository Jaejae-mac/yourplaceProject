package com.yourplace.admin.banner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.banner.dao.BannerDAO;
import com.yourplace.admin.banner.vo.BannerVO;

@Service("avilableService")
public class AvailableServiceImpl implements AvailableService{

	@Autowired
	private BannerDAO bannerDAO;
	
	@Override
	public int availableBanner(String bannerNum) {
		return bannerDAO.availableBanner(bannerNum);
	}

	@Override
	public void ableBanner(String bannerNum) {
		bannerDAO.ableBanner(bannerNum);
	}

	@Override
	public void disableBanner(String bannerNum) {
		bannerDAO.disableBanner(bannerNum);
	}

}
