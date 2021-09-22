package com.yourplace.admin.faq.host.dao;

import java.util.List;

import com.yourplace.admin.faq.host.vo.FaqHostVO;

public interface FaqHostDAO {
	
	List<FaqHostVO> getFaqList();
	
	void deleteInfoHost(String deleteInfoTitle);
	
	void insertInfo(FaqHostVO vo);

}
