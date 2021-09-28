package com.yourplace.admin.faq.guest.dao;

import java.util.List;

import com.yourplace.admin.faq.guest.vo.FaqGuestVO;

public interface FaqGuestDAO {
	
	List<FaqGuestVO> getFaqList();
	
	void deleteInfoGuest(String deleteInfoTitle);
	
	void insertInfo(FaqGuestVO vo);

}
