package com.yourplace.custom.invoice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yourplace.custom.invoice.dao.InvoiceDAO;
import com.yourplace.custom.invoice.service.InvoiceService;
import com.yourplace.custom.invoice.vo.InvoiceVO;

@Service("InvoiceService")
public class InvoiceServiceImpl implements InvoiceService {

	
	@Autowired
	private InvoiceDAO invoiceDAO;
	@Override
	public InvoiceVO invoiceView(InvoiceVO vo) {
		System.out.println("[InvoiceServiceImpl]"+ vo.toString());
		return invoiceDAO.invoiceView(vo);
	}

}
