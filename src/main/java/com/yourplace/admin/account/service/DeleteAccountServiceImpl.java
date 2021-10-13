package com.yourplace.admin.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.account.dao.AccountDAO;

@Service("deleteAdmin")
public class DeleteAccountServiceImpl implements DeleteAccountService {

	@Autowired
	private AccountDAO accountDAO;
	
	@Override
	public void deleteAdmin(int num) {
		accountDAO.deleteAdmin(num);
	}

}
