package com.yourplace.admin.banner.dao;

import java.util.List;

import com.yourplace.admin.banner.vo.BannerVO;

public interface BannerDAO {

	//등록된 내용 조회
	List<BannerVO> getBannerList();
	
	//이미지 업로드와 동시에 table에 insert
	void insertUploadImg(BannerVO vo);
	
	//이미지 삭제와 동시에 table에서 delete
	void deleteBanner(String bannerNum);
	
	//배너 번호 가져오기 가장 최신 번호만 쭉쭉 가져옴
	int getBannerNum();
	
	//상태 조회
	int availableBanner(String bannerNum);
	
	//update to "able"
	void ableBanner(String bannerNum);
	
	//update to "disable"
	void disableBanner(String bannerNum);
	
}
