package com.yourplace.custom.invoice.dao;

import java.util.List;

import com.yourplace.custom.invoice.vo.InvoiceVO;

public interface InvoiceDAO {

	List<InvoiceVO> invoiceView(InvoiceVO vo);
}
