package com.yourplace.admin.faq.guest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.faq.guest.dao.FaqGuestDAO;
import com.yourplace.admin.faq.guest.vo.FaqGuestVO;

@Service("insertInfoService")
public class InsertFaqGuestServiceImpl implements InsertFaqGuestService {

	@Autowired
	private FaqGuestDAO faqGuestDAO;
	
	@Override
	public void insertInfo(FaqGuestVO vo) {
		
		System.out.println("InsertFaqGuestService 실행");
		faqGuestDAO.insertInfo(vo);

	}

}
