package com.yourplace.admin.banner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.banner.vo.BannerVO;

@Repository("bannerDAO")
public class BannerDAOImpl implements BannerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<BannerVO> getBannerList() {
		System.out.println("---> MyBatis 로 getBannerList 기능 처리");
		List<BannerVO> list = sqlSessionTemplate.selectList("BannerDAO.getBannerList");
		System.out.println("[DAOImpl] list 의 내용 : " + list.toString());
		return list;
	}

	@Override
	public void insertUploadImg(BannerVO vo) {
		//String FileName, String s3FileName
		System.out.println("---> MyBatis 로 inserUploadImg 기능 처리");
		sqlSessionTemplate.insert("BannerDAO.insertUploadImg", vo);

	}

	@Override
	public void deleteBanner(String bannerNum) {
		System.out.println("---> MyBatis 로 deleteBanner 기능 처리");
		sqlSessionTemplate.insert("BannerDAO.deleteBanner", bannerNum);
	}

	//하나 더 큰 숫자 불러옴
	@Override
	public int getBannerNum() {
		System.out.println("---> MyBatis 로 getBannerNum 기능 처리");
		int num = sqlSessionTemplate.selectOne("BannerDAO.getBannerNum");
		System.out.println("조회한 번호: " + num);
		return num;
	}

	@Override
	public int availableBanner(String bannerNum) {
		System.out.println("---> MyBatis 로 availableBanner 기능 처리");
		int show = sqlSessionTemplate.selectOne("BannerDAO.availableBanner", bannerNum);
		return show;
	}

	@Override
	public void ableBanner(String bannerNum) {
		System.out.println("---> MyBatis 로 ableBanner 기능 처리");
		sqlSessionTemplate.update("BannerDAO.ableBanner", bannerNum);
	}

	@Override
	public void disableBanner(String bannerNum) {
		System.out.println("---> MyBatis 로 disableBanner 기능 처리");
		sqlSessionTemplate.update("BannerDAO.disableBanner", bannerNum);
	}

}
