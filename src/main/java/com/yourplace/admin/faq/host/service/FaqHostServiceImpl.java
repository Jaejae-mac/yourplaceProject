package com.yourplace.admin.faq.host.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.admin.faq.host.dao.FaqHostDAO;
import com.yourplace.admin.faq.host.vo.FaqHostVO;

@Service("infoHostService")
public class FaqHostServiceImpl implements FaqHostService {

	@Autowired
	private FaqHostDAO faqHostDAO;
	
	@Override
	public List<FaqHostVO> getFaqList() {
		
		List<FaqHostVO> list = faqHostDAO.getFaqList();
		return list;
		
	}

}
