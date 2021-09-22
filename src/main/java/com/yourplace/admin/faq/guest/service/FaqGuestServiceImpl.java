package com.yourplace.admin.faq.guest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.faq.guest.dao.FaqGuestDAO;
import com.yourplace.admin.faq.guest.vo.FaqGuestVO;

@Service("infoGuestService")
public class FaqGuestServiceImpl implements FaqGuestService {

	@Autowired
	private FaqGuestDAO faqGuestDAO;
	
	@Override
	public List<FaqGuestVO> getFaqList() {
		
		List<FaqGuestVO> list = faqGuestDAO.getFaqList();
		return list;
		
	}

}
