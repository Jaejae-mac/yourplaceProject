package com.yourplace.custom.question.dao;

import java.util.List;

import com.yourplace.custom.question.vo.GuestInfoVO;
import com.yourplace.custom.question.vo.HostInfoVO;
import com.yourplace.custom.question.vo.QuestionVO;

public interface QuestionDAO {

	//1:1 문의하기 등록 처리 메서드 
	void guestQues(QuestionVO vo);
	
	//신고하기 등록 처리 메서드 
	void guestReport(QuestionVO vo);
	
	//guestInfo 를 불러오기 위한 메서드
	
	List<GuestInfoVO> guestInfoView(GuestInfoVO vo);
	

	List<HostInfoVO> hostInfoView(HostInfoVO vo);
	

}
