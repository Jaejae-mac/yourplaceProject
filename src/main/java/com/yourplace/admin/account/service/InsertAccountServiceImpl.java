package com.yourplace.admin.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.account.dao.AccountDAO;
import com.yourplace.admin.account.vo.AccountVO;


@Service("insertAdmin")
public class InsertAccountServiceImpl implements InsertAccountService {

	@Autowired
	private AccountDAO accountDAO;
	
	@Override
	public void insertAccount(AccountVO vo) {
		accountDAO.insertAccount(vo);

	}

}
