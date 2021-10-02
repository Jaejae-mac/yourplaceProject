package com.yourplace.admin.space.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.yourplace.commons.mailsender.MailHandler;

@Service("sendEmail")
public class SendEmailService {

	@Autowired
	private JavaMailSenderImpl mailSender;

	//승인 이메일 내용
	public String allowEmail(String email)
	{
		try {
			MailHandler mailHanlder = new MailHandler(mailSender);
			
			System.out.println("--------------------------");
			System.out.println("MailSender Processing");
			System.out.println("--------------------------");
	
			MimeMessage message = mailSender.createMimeMessage();
			
			String response = "<h2>[등록하신 장소에 대한 안내]</h2>"
					+ "<p> 호스트 님, 안녕하세요! </p></br>"
					+ "<p> 호스트 님께서 등록하신 장소가 정상적으로 승인 되었습니다. </p></br>"
					+ "<p> 해당 장소는 오늘 정오부터 YourPlace 에 신규 장소로 등록될 예정입니다. </p></br>"
					+ "<p> YourPlace 를 이용해 주셔서 감사합니다. </p></br>"
					+ "<p> 장소 대여 및 결제 관련하여는 FAQ 를 확인하여 주시기 바랍니다. </p></br>"
					+ "<p> 추가 문의사항은 홈페이지 문의사항을 통해 보내주시면 감사하겠습니다. </p></br>"
					+ "<p> YourPlace Team </p></br>" + " <p>Tel: 02-1234-1234</p></br> " + " <p>Email: project2kg@kakao.com </p></br>"
					+ "<p> 본 메일은 발신 전용 메일이며, 수신이 불가하니 참고하여 주시기 바랍니다. </p></br>";
					
			
			//제목 설정
			mailHanlder.setSubject("[YourPlace] 신청하신 장소 등록이 승인되었습니다.");
			//수신자 메일 설정
			mailHanlder.setTo(email);
			//내용 및 html 사용여부 설정
			mailHanlder.setText(response, true);
			
			//메일 전송
			mailHanlder.send();
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		return "Send to client";
	}
	
	///////////////////////////////////////////////////
	//미승인 이메일 내용
	public String denyEmail(String email)
	{
		try {
			MailHandler mailHanlder = new MailHandler(mailSender);
			
			System.out.println("--------------------------");
			System.out.println("MailSender Processing");
			System.out.println("--------------------------");
	
			MimeMessage message = mailSender.createMimeMessage();
			
			String response = "<h2>[등록하신 장소에 대한 안내]</h2>"
					+ "<p> 호스트 님, 안녕하세요! </p></br>"
					+ "<p> 등록하신 장소는 YourPlace 정책에 위반되어 미승인처리 되었음을 안내 드립니다. </p></br>"
					+ "<p> 미승인 처리되는 사유는 아래와 같은 내용이 있으니, 확인하여 주시기 바랍니다. </p></br>"
					+ "<p> 1. 부적절한 목적의 장소 </p></br>"
					+ "<p> 2. 정확하게 확인되지 않은 주소지 </p></br>"
					+ "<p> 3. 정확하지 않은 장소등록 정보 (이미지, 내용, 등) </p></br>"
					+ "<p> 4. 사용이 제재된 호스트의 장소 </p></br>"
					+ "<p> 5. 신고 누적으로 인한 미승인 및 정지 처리 </p></br>"
					+ "<p> YourPlace 를 이용해 주셔서 감사합니다. </p></br>"
					+ "<p> 추가 문의사항은 홈페이지 문의사항을 통해 보내주시면 감사하겠습니다. </p></br>"
					+ "<p> YourPlace Team </p></br>" + " <p>Tel: 02-1234-1234</p></br> " + " <p>Email: project2kg@kakao.com </p></br>"
					+ "<p> 본 메일은 발신 전용 메일이며, 수신이 불가하니 참고하여 주시기 바랍니다. </p></br>";
					
			
			//제목 설정
			mailHanlder.setSubject("[YourPlace] 신청하신 장소 등록이 승인되지 않았습니다.");
			//수신자 메일 설정
			mailHanlder.setTo(email);
			//내용 및 html 사용여부 설정
			mailHanlder.setText(response, true);
			
			//메일 전송
			mailHanlder.send();
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		return "Send to client";
	}
	
}
