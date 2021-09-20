package com.yourplace.user.coupon;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yourplace.custom.mypage.service.MyPageCouponService;
import com.yourplace.custom.mypage.vo.MyPageCouponVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/resources/applicationContext.xml","file:src/main/webapp/WEB-INF/config/custom-layer.xml"})
public class CouponTest {
	@Autowired
	MyPageCouponService myPageCouponService;
	@Test
	public void couponTest() {
		MyPageCouponVO vo = new MyPageCouponVO();
		vo.setUserCoupId("955wlsgh");
		List<MyPageCouponVO> tvo =myPageCouponService.getCouponList(vo);
		for(MyPageCouponVO t : tvo) {
			System.out.println(t.toString());
		}
		
	}

}
