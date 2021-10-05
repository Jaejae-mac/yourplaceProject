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

	@Override
	public int getBannerNum() {
		System.out.println("---> MyBatis 로 getBannerNum 기능 처리");
		int num = sqlSessionTemplate.selectOne("BannerDAO.getBannerNum");
		return num;
	}

	@Override
	public int availableBanner() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void ableBanner() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void disableBanner() {
		// TODO Auto-generated method stub
		
	}

}
