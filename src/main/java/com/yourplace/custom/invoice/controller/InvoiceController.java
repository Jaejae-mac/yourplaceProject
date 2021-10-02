package com.yourplace.custom.invoice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yourplace.custom.invoice.service.InvoiceService;
import com.yourplace.custom.invoice.vo.InvoiceVO;

@Controller
public class InvoiceController {
	
	@Autowired
	private InvoiceService invoiceService;
	
	@RequestMapping("/test.do")
	public String test() {
		return "question/test";
	}
	@GetMapping("/invoice.do")
	public String invoiceForm(Model model, InvoiceVO vo) {
		System.out.println("invoice.jsp 호출 ");
		System.out.println(vo.toString());
		model.addAttribute("payment", invoiceService.invoiceView(vo));
		System.out.println(model);
		return "invoice";
	}
	
}
