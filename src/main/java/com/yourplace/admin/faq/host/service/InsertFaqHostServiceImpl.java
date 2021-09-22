package com.yourplace.admin.faq.host.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.faq.guest.dao.FaqGuestDAO;
import com.yourplace.admin.faq.guest.vo.FaqGuestVO;
import com.yourplace.admin.faq.host.dao.FaqHostDAO;
import com.yourplace.admin.faq.host.vo.FaqHostVO;

@Service("insertHostInfoService")
public class InsertFaqHostServiceImpl implements InsertFaqHostService {

	@Autowired
	private FaqHostDAO faqHostDAO;
	
	@Override
	public void insertInfo(FaqHostVO vo) {
		
		System.out.println("InsertFaqGuestService 실행");
		faqHostDAO.insertInfo(vo);

	}

}
