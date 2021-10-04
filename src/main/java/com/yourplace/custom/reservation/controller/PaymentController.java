package com.yourplace.custom.reservation.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.yourplace.commons.json.ReadJsonFile;
import com.yourplace.custom.reservation.service.ReservationService;
import com.yourplace.custom.reservation.vo.PaymentVO;
import com.yourplace.custom.reservation.vo.RsvVO;

@RestController
public class PaymentController {
	private IamportClient api;
	private ReadJsonFile file = new ReadJsonFile();
	private String accessKey;
	private String secretKey;
	@Autowired
	private ReservationService reservationService;
	public PaymentController() {
		try {
			List<String> keys = Arrays.asList("impAccessKey","impSecretKey");
			List<String> values = file.parser(keys);
			accessKey = values.get(0);
			secretKey = values.get(1);
			this.api = new IamportClient(accessKey,secretKey);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
				
	}
	
	@ResponseBody
	@RequestMapping(value="/importnum.do")
	public String importNum() {
		String impCode = "";
		try {
			List<String> keys = Arrays.asList("impCode");
			List<String> values = file.parser(keys);
			impCode = values.get(0);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		return impCode;
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport.do")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @RequestParam("imp_uid")String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	
	@ResponseBody
	@PostMapping(value="/registReserve.do")
	@CrossOrigin(origins = "*")
	public String registReserve(RsvVO vo) {
		System.out.println("[POST] registReserve.do--------------");
		System.out.println("전달받은 객체 : " + vo.toString());
		//예약번호 -> 장소번호 + 현재시간(2~8자리)
		String rsvNum = vo.getPlaceNum()+String.valueOf(new Date().getTime()).substring(6);
		vo.setRsvTel(vo.getRsvTel().replace("-", ""));
		vo.setRsvNum(rsvNum);
		Calendar cal = Calendar.getInstance();
		int payYear = cal.get(Calendar.YEAR);
		int payMonth = cal.get(Calendar.MONTH)+1;
		int payDate = cal.get(Calendar.DAY_OF_MONTH);
		
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setRsvNum(vo.getRsvNum());
		paymentVO.setPayNum(vo.getPayNum());
		paymentVO.setPlaceMaincate(vo.getPlaceMaincate());
		paymentVO.setPlaceCate(vo.getPlaceCate());
		paymentVO.setPayYear(payYear);
		paymentVO.setPayMonth(payMonth);
		paymentVO.setPayDate(payDate);
		paymentVO.setPlaceMaincate(vo.getPlaceMaincate());
		paymentVO.setPlaceCate(vo.getPlaceCate());
		int invCost = vo.getInvBfTax() + (vo.getInvBfTax()*(vo.getCoupDisRate()/100));
		paymentVO.setInvCost(invCost);
		paymentVO.setCoupDisRate(vo.getCoupDisRate());
		paymentVO.setInvBfTax(vo.getInvBfTax());
		paymentVO.setInvTax((int)(paymentVO.getInvBfTax()*(0.1)));
		paymentVO.setInvAftTax(paymentVO.getInvBfTax() - paymentVO.getInvTax());
		paymentVO.setUserNum(vo.getUserNum());
		paymentVO.setPayCoupNum(vo.getPayCoupNum());
		paymentVO.setOrderNum(vo.getOrderNum());
		System.out.println(paymentVO.toString());
		System.out.println("수정된 객체 RSV VO : " + vo.toString());
		int rst = reservationService.registReservation(vo,paymentVO);
		return String.valueOf(rst);
	}
	
	
}
