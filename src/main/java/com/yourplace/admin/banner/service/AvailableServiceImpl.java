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
		System.out.println("[Service] " + bannerNum + " 번 이미지 현재 상태 조회");
		return bannerDAO.availableBanner(bannerNum);
	}

	@Override
	public void ableBanner(String bannerNum) {
		System.out.println("[Service] 선택한 이미지를 공개로 전환합니다.");
		bannerDAO.ableBanner(bannerNum);
	}

	@Override
	public void disableBanner(String bannerNum) {
		System.out.println("[Service] 선택한 이미지를 비공개로 전환합니다.");
		bannerDAO.disableBanner(bannerNum);
	}

}
