package com.yourplace.custom.invoice.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yourplace.custom.invoice.dao.InvoiceDAO;
import com.yourplace.custom.invoice.vo.InvoiceVO;

@Repository("invoiceDAO")
public class InvoiceDAOImpl implements InvoiceDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public InvoiceVO invoiceView(InvoiceVO vo) {
		return (InvoiceVO) sqlSessionTemplate.selectOne("InvoiceDAO.invoiceView", vo);
	}

}
