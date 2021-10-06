package com.yourplace.admin.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yourplace.admin.payment.service.PaymentService;
import com.yourplace.admin.payment.service.RefundProcessService;
import com.yourplace.admin.payment.vo.PaymentVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private RefundProcessService refundService;
	
	//결제내역
	@GetMapping(value="/paymentView.mdo")
	public void paymentViewForm(Model model)
	{
		System.out.println("[Controller] 예약조회 뷰 호출");
		List<PaymentVO> list = paymentService.getPayment();
		model.addAttribute("paymentList", list);
	}
	
	//환불내역
	@GetMapping(value="/refundView.mdo")
	public void refundViewForm(Model model)
	{
		System.out.println("[Controller] 환불조회 뷰 호출");
		List<PaymentVO> list = paymentService.getRefund();
		model.addAttribute("refundList", list);
	}
	
	@PostMapping(value="/refundProcess.mdo")
	public String refundProcess(HttpServletRequest request)
	{
		System.out.println("[Controller] 환불처리 진행");
		
		String num = request.getParameter("refudnNumName");
		//쿠폰 사용했다면 재발급
		refundService.refundCoupon(num);
		//rsv_refund_yn 상태변경
		refundService.refundDone(num);
		
		System.out.println("[Controller] 쿠폰 확인과 상태 변경이 완료되었습니다.");
		
		return "redirect:refundView.mdo";
	}

}
