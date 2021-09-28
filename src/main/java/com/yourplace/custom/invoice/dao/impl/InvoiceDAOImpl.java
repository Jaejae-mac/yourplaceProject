package com.yourplace.custom.invoice.dao.impl;

import java.util.List;

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
	public List<InvoiceVO> invoiceView(InvoiceVO vo) {
		System.out.println("---> MyBatis로 invoiceView() 기능 처리");
		List<InvoiceVO> list = sqlSessionTemplate.selectList("InvoiceDAO.invoiceView", vo);
		System.out.println("[InvoiceDAO]"+ list.toString());
		return list;
	}

}
