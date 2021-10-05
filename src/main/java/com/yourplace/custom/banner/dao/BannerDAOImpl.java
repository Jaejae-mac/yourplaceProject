package com.yourplace.custom.banner.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.banner.vo.BannerVO;

@Repository("bannerdao")
public class BannerDAOImpl implements BannerDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<BannerVO> displayBanner() {
		System.out.println("---> MyBatis 로 displayBanner 기능 처리");
		List<BannerVO> list = sqlSessionTemplate.selectList("BannerDAO.displayBanner");
		return list;
	}

}
