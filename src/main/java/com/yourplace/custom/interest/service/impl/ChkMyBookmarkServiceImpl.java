package com.yourplace.custom.interest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.interest.dao.InterestDAO;
import com.yourplace.custom.interest.service.ChkMyBookmarkService;
import com.yourplace.custom.interest.vo.InterestVO;

@Service("chkMyBookmarkService")
public class ChkMyBookmarkServiceImpl implements ChkMyBookmarkService {

	@Autowired
	private InterestDAO interestDAO;
	
	@Override
	public boolean chkMyBookmark(InterestVO vo) {
		InterestVO temp = interestDAO.checkBookmark(vo);
		boolean result = false;
		if(temp != null) {
			result = true;
		}
		return result;
	}

}
