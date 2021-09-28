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
		System.out.println("[Service] 모든 어드민 리스트를 조회합니다.");
		return accountDAO.getAccountList();
	}

}
