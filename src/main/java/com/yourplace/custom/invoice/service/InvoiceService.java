package com.yourplace.custom.invoice.service;

import java.util.List;

import com.yourplace.custom.invoice.vo.InvoiceVO;

public interface InvoiceService {

	
	List<InvoiceVO> invoiceView(InvoiceVO vo);
}
