package com.yourplace.custom.interest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.interest.dao.InterestDAO;
import com.yourplace.custom.interest.service.BookmarkService;
import com.yourplace.custom.interest.vo.InterestVO;

@Service("bookmarkService")
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	private InterestDAO interestDAO;
	
	@Override
	public int bookmark(InterestVO vo) {	
		InterestVO temp = interestDAO.checkBookmark(vo);
		int result = 0; //0 이면 북마크 등록 없앤것, 1이면 북마크 등록 한것.
		//사용자가 북마크를 추가한적 있는 것이라면.
		if(temp != null) {
			interestDAO.deleteBookmark(vo);
			result = 0;
			
		}
		//사용자가 북마크를 추가한적 없는 것이라면.
		else {
			interestDAO.insertBookmark(vo);
			result = 1;
		}
		return result;

	}

}
