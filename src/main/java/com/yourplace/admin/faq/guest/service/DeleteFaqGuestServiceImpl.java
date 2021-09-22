package com.yourplace.admin.faq.guest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.faq.guest.dao.FaqGuestDAO;

@Service("deleteInfoService")
public class DeleteFaqGuestServiceImpl implements DeleteFaqGuestService {

	@Autowired
	private FaqGuestDAO faqGuestDAO;
	
	@Override
	public void deleteInfoGuest(String deleteInfoTitle) {
			
		faqGuestDAO.deleteInfoGuest(deleteInfoTitle);

	}

}
