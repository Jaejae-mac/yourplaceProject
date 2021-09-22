package com.yourplace.host.login.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yourplace.host.login.dao.HostLoginDAO;
import com.yourplace.host.login.vo.HostVO;

@Service
public class HostLoginServiceImpl implements HostLoginService{
	
	@Inject
	private HostLoginDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;

	@Override
	public List<HostVO> getHostInfo(HostVO vo) throws Exception {
		List<HostVO> list = dao.getHostInfo(vo);
//		System.out.println(list.toString());
		return dao.getHostInfo(vo);
	}
	
	@Override
	public int getHostLogin(HostVO vo) {
		HostVO hvo = dao.getHost(vo);
		// 아이디를 조건으로 DB select 시도 후 , 리턴받은 값이 Null 이 아니라면.
		if (hvo != null) {
			// 리턴받은 객체의 비밀번호와 매개로 전달받은 객체의 비밀번호를 비교하여 같다면.
			if (passEncoder.matches(vo.getUserPw(), hvo.getUserPw())) {
				// 1을 리턴해주겠다. :
				return 1;
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}

	@Override
	public void updateProfile(HostVO vo) throws Exception {
		dao.updateProfile(vo);
		
	}


}