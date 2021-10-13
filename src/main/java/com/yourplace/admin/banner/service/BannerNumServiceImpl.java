package com.yourplace.admin.banner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.banner.dao.BannerDAO;

@Service("getBannerNum")
public class BannerNumServiceImpl implements BannerNumService {

	@Autowired
	private BannerDAO bannerDAO;
	
	@Override
	public int getBannerNum() {
		return bannerDAO.getBannerNum();
	}

}
