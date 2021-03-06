package com.yourplace.admin.banner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.banner.dao.BannerDAO;
import com.yourplace.admin.banner.vo.BannerVO;

@Service("insertUpload")
public class InsertUploadServiceImpl implements InsertUploadService {

	@Autowired
	private BannerDAO bannerDAO;
	
	@Override
	public void insertUploadImg(BannerVO vo) {
		bannerDAO.insertUploadImg(vo);

	}

}
