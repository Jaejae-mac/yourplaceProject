package com.yourplace.admin.question.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.yourplace.commons.mailsender.MailHandler;

@Service("sendResponse")
public class SendResponseMail {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
//	private int size;
//
//	// 인증키 생성
//	private String getKey(int size) {
//		this.size = size;
//		return getAuthCode();
//	}
//
//	// 인증코드 난수 발생
//	private String getAuthCode() {
//		Random random = new Random();
//		StringBuffer buffer = new StringBuffer();
//		int num = 0;
//
//		while (buffer.length() < size) {
//			num = random.nextInt(10);
//			buffer.append(num);
//		}
//
//		return buffer.toString();
//	}
	
	public String sendResponse(String id, String number, String email, String content, String question)
	{
		System.out.println(mailSender);
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MailHandler mailHanlder = new MailHandler(mailSender);
			
			//메일 내용 response 문자열에 담아서 작성
			String response = "<h2>[문의 내용에 대한 답변]</h2>"
					+ "<p>" + id + "님, </p></br>"
					+ "<p>예약번호/장소번호 " + number + " 번 문의 에 대한 답변입니다. </p></br></br></br>"
					+ "<h4>[문의 내용]</h4></br>"
					+ "<p>" + question + "</p></br></br>"
					+ "<h4>[답변 내용]</h4></br>"
					+ "<p>" + content + "</p></br></br></br>"
					+ "<p>답변이 도움이 되셨나요? 추가 문의사항은 홈페이지 문의사항을 통해 보내주시면 감사하겠습니다.</p></br>"
					+ "<p>YourPlace Team</p></br>" + "<p>Tel: 02-1234-1234</p></br>" + "<p>Email: project2kg@kakao.com</p></br>"
					+ "<p>본 메일은 발신 전용 메일이며, 수신이 불가하니 참고하여 주시기 바랍니다.</p></br>";
			
			//제목 설정
			mailHanlder.setSubject("[YourPlace] 보내주신 문의에 대한 답변입니다.");
			//수신자 메일 설정
			mailHanlder.setTo(email);
			//내용 및 html 사용여부 설정
			mailHanlder.setText(response, true);
			
			//메일 전송
			mailHanlder.send();
			
		} catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		return "send to client";
		
	}
	
}
