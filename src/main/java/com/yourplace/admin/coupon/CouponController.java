package com.yourplace.admin.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.admin.coupon.all.service.CouponListService;
import com.yourplace.admin.coupon.all.service.DeleteCouponService;
import com.yourplace.admin.coupon.all.service.InsertCouponService;
import com.yourplace.admin.coupon.all.vo.CouponAllVO;
import com.yourplace.admin.coupon.user.service.CouponUserService;
import com.yourplace.admin.coupon.user.vo.CouponUserVO;

@Controller
public class CouponController {
	
	@Autowired
	private CouponListService coupAllList;
	
	@Autowired
	private DeleteCouponService coupDelete;
	
	@Autowired
	private InsertCouponService coupInsert;
	
	@Autowired
	private CouponUserService coupUserSend;
	
	
	//쿠폰 조회 페이지 호출
	@GetMapping(value="/couponView.mdo")
	public void couponTable(Model model)
	{
		List<CouponAllVO> list = coupAllList.getCouponList();
		
		System.out.println("-------[CouponView Controller]------");
		System.out.println(list.toString());
		
		model.addAttribute("couponList", list);
		
	}
	
	//쿠폰 삭제 요청 처리
	@PostMapping(value="/deleteCoupon.mdo")
	public String deleteCoupon(@RequestParam("deleteCoupName") String deleteCoupName)
	{
		System.out.println("------- 삭제할 쿠폰이름 조회 -------");
		System.out.println("Parameter Value: " + deleteCoupName);
		coupDelete.deleteCoupon(deleteCoupName);
		return "redirect:couponView.mdo";
	}
	
	
	//쿠폰등록 페이지 호출
	@GetMapping(value="/couponRegist.mdo")
	public String regCoupForm()
	{
		return "couponRegist";
	}
	
	
	//쿠폰등록 요청 처리
	@PostMapping(value="/couponRegist.mdo")
	public String registCoupon(CouponAllVO coupVO)
	{
		System.out.println("----- 쿠폰 등록창 ------");
		coupInsert.insertCoupon(coupVO);
		System.out.println("쿠폰 등록 완료: " + coupVO.toString());
		
		return "redirect:couponView.mdo";
	}
	
	
	//쿠폰전송 페이지 호출
	@GetMapping(value="/couponSend.mdo")
	public String sendCoupForm()
	{
		return "couponSend";
	}
	
	//쿠폰 전송 처리
	@PostMapping(value="/couponSend.mdo")
	public String sendCoupon(@RequestParam("sendCoupName") String sendCoupName, CouponUserVO vo)
	{
		System.out.println("---쿠폰 전송---");
		coupUserSend.sendCoupon(vo, sendCoupName);
		System.out.println("정상적으로 전송되었습니다.");
		return "redirect:couponView.mdo";
	}

}
