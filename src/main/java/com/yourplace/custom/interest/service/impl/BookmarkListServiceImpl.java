package com.yourplace.custom.interest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.interest.dao.InterestDAO;
import com.yourplace.custom.interest.service.BookmarkListService;
import com.yourplace.custom.interest.vo.InterestVO;

@Service("bookmarkListService")
public class BookmarkListServiceImpl implements BookmarkListService {

	@Autowired
	private InterestDAO interestDAO;
	
	@Override
	public List<InterestVO> bookmarkList(InterestVO vo) {
		return interestDAO.interestView(vo);
	}

}
