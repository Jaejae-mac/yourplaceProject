package com.yourplace.admin.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.admin.account.vo.AccountVO;

@Repository("accountDAO")
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AccountVO> getAccountList() {
		System.out.println("---> MyBatis 로 getAccountList 기능 처리");
		List<AccountVO> list = sqlSessionTemplate.selectList("AccountDAO.getAccountList");
		return list;
	}

	@Override
	public void insertAccount(AccountVO vo) {
		System.out.println("---> MyBatis 로 insertAccount 기능 처리 ");
		sqlSessionTemplate.insert("AccountDAO.insertAccount", vo);
		
	}

}
