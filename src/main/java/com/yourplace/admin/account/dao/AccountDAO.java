package com.yourplace.admin.account.dao;

import java.util.List;

import com.yourplace.admin.account.vo.AccountVO;

public interface AccountDAO {

	List<AccountVO> getAccountList();
	
	void insertAccount(AccountVO vo);
	
}
