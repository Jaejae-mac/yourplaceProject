package com.yourplace.admin.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yourplace.admin.payment.service.PaymentService;
import com.yourplace.admin.payment.vo.PaymentVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping(value="/paymentView.mdo")
	public void reserveViewForm(Model model)
	{
		System.out.println("예약조회 뷰 호출");
		List<PaymentVO> list = paymentService.getPayment();
		model.addAttribute("paymentList", list);
	}

}
