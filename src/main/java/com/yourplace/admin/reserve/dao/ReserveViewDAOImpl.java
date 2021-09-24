package com.yourplace.admin.reserve.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.reserve.vo.ReserveVO;

@Repository("reserveViewDAO")
public class ReserveViewDAOImpl implements ReserveViewDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ReserveVO> getReserve() {
		
		System.out.println("---> MyBatis 로 getReserve() 기능 처리");
		return sqlSessionTemplate.selectList("ReserveDAO.getReserve");
	}

}
