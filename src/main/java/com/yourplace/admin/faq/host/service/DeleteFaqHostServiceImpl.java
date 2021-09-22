package com.yourplace.admin.faq.host.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.faq.host.dao.FaqHostDAO;

@Service("deleteHostInfoService")
public class DeleteFaqHostServiceImpl implements DeleteFaqHostService {

	@Autowired
	private FaqHostDAO faqHostDAO;
	
	@Override
	public void deleteInfoHost(String deleteInfoTitle) {
			
		faqHostDAO.deleteInfoHost(deleteInfoTitle);

	}

}
