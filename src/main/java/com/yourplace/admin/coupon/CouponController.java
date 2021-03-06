package com.yourplace.admin.coupon;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.yourplace.admin.coupon.user.service.SendCouponService;
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
	private CouponUserService coupUserService;
	
	@Autowired
	private SendCouponService sendService;
	
	
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
	public String deleteCoupon(@RequestParam("deleteCoupName") String deleteCoupNum, @RequestParam("deleteCoupNum") String deleteNum)
	{
		System.out.println("------- 삭제할 쿠폰이름 조회 -------");
		System.out.println("Parameter Value: " + deleteCoupNum);
		coupDelete.deleteCoupon(deleteCoupNum);
		coupUserService.deleteUser(deleteNum);
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
	
	//수정한 쿠폰전송 controller
	@PostMapping(value="/couponSend.mdo")
	public String modifiedSendCoup(HttpServletRequest request) throws ParseException {
		
		System.out.println("[Controller] 쿠폰을 전송합니다. // modifiedSendCoup Method");
		
		//값 받기
		String num = request.getParameter("numCoup");
		String std = request.getParameter("startD");
		String ed = request.getParameter("endD");
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date startD = fmt.parse(std);
		Date endD = fmt.parse(ed);
		
		System.out.println("[Controller] 받아온 값을 조회합니다.");
		System.out.println("-------------------------------");
		System.out.println("num: " + num + "startD" + startD + "endD" + endD);
		System.out.println("-------------------------------");
		
		sendService.addCoupon(num, startD, endD);
		
		return "redirect:couponView.mdo";
	}
	
	@PostMapping(value="/alldelete.mdo")
	public String alldelete()
	{
		System.out.println("[Controller] 기한만료 전체삭제");
		coupDelete.deleteAllCoupon();
		return "redirect:couponView.mdo";
	}
}
