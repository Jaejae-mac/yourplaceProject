package com.yourplace.admin.banner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.banner.dao.BannerDAO;
import com.yourplace.admin.banner.vo.BannerVO;

@Service("getlistService")
public class GetListServiceImpl implements GetListService {

	@Autowired
	private BannerDAO bannerDAO;
	
	@Override
	public List<BannerVO> getBannerList() {
		return bannerDAO.getBannerList();
	}

}
