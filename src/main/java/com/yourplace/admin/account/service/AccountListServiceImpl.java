package com.yourplace.admin.account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.account.dao.AccountDAO;
import com.yourplace.admin.account.vo.AccountVO;

@Service("accountList")
public class AccountListServiceImpl implements AccountListService {

	@Autowired
	private AccountDAO accountDAO;
	
	@Override
	public List<AccountVO> getAccountList() {
		return accountDAO.getAccountList();
	}

}
