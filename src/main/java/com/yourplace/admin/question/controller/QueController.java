package com.yourplace.admin.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.question.service.AnswerService;
import com.yourplace.admin.question.service.InsertAnswerService;
import com.yourplace.admin.question.service.QuestionService;
import com.yourplace.admin.question.service.SendResponseMail;
import com.yourplace.admin.question.service.UpdateStatusService;
import com.yourplace.admin.question.vo.AnswerVO;
import com.yourplace.admin.question.vo.QuestionVO;

@Controller
public class QueController {

	//조회 서비스
	@Autowired
	private QuestionService queService;
	@Autowired
	private AnswerService ansService;
	
	//메일 전송 서비스 - 문의에 대한 답변 전송
	@Autowired
	private SendResponseMail sendResponse;
	
	//문의상태 변경 서비스
	@Autowired
	private UpdateStatusService updateService;
	
	@Autowired
	private InsertAnswerService insertAnswerService;
	
	@GetMapping(value="/questionView.mdo")
	public String queView(Model model)
	{
		System.out.println("[Controller] 문의사항 리스트 호출");
		List<QuestionVO> list = queService.getQue();
		model.addAttribute("queList", list);
		return "questionView";
	}
	
	@GetMapping(value="/answerView.mdo")
	public String ansView(Model model)
	{
		System.out.println("[Controller] 문의사항 리스트 호출");
		List<AnswerVO> list = ansService.getAns();
		model.addAttribute("ansList", list);
		return "answerView";
	}
	
	@PostMapping(value="/sendQuestion.mdo")
	public String sendQue(HttpServletRequest request)
	{
		//답변을 위해 view에 입력된 값 얻어와서 테스트 출력
		String id = request.getParameter("userId");
		String email = request.getParameter("userEmail");
		String number = request.getParameter("rsvNum");
		String content = request.getParameter("repliedContent");
		String question = request.getParameter("question");
		
		//상태 변경을 위해 Report Seq 얻기
		String reportNum = request.getParameter("reportSeq");
		int reprtSeq = Integer.parseInt(reportNum);
		
		System.out.println("------ 문의 접수 후 이메일 답변처리 ------");
		System.out.println("사용자 아이디: " + id);
		System.out.println("사용자 이메일: " + email);
		System.out.println("예약번호/장소번호: " + number);
		System.out.println("문의내용: " + question);
		System.out.println("답변내용: " + content);
		System.out.println("----------------------------------");
		
		//메일 전송 서비스
//		sendResponse.sendResponse(id, number, email, content, question);
		System.out.println("문의답변 메일 정상 발송 완료");
		
		//답변 테이블에 값을 삽입하는과정.
		AnswerVO insertAnsVO = new AnswerVO();
		insertAnsVO.setUserId(id);
		insertAnsVO.setRsvNum(number);
		insertAnsVO.setReprtContentAns(content);
		insertAnswerService.insertAnswer(insertAnsVO);
		
		System.out.println("문의사항 View List 페이지로 돌아갑니다.");
		
		//보냄과 동시에 문의사항 업데이트
		System.out.println("[Controller] 문의사항 상태 업데이트");
		updateService.updateStatus(reprtSeq);
		
		return "redirect:questionView.mdo";
	}
	
	
}
