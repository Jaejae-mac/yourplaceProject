package com.yourplace.host.pay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class paymentController {
	
	@ResponseBody
	@RequestMapping(value="/pay.hdo", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView test(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
	
	
//		int amountToBePaid =100;
//		if (amount == amountToBePaid) {
//			  // 결제 금액 일치. 결제 된 금액 === 결제 되어야 하는 금액
//			  // 결제 성공시에 진행해야할 로직 그대로 진행
//				System.out.println("결제 금액 일치");
//			} else {
//				System.out.println("위조된 결제 시도");
//				  
//			  };
//			  //에러를 띄우지만 현재 상태는 결제가 되어있는 상태다.
//			  //즉 10,000을 1,000으로 수정해서 결제했다면 일단 1,000이 결제되어 있는 상태인 것이다.
		
		mav.setViewName("pay");
		
		return mav;
	
}
	
	@RequestMapping(value="/payment.hdo" ,method = {RequestMethod.GET, RequestMethod.POST})
	public void getAllPay(HttpServletRequest request) throws Exception{
		String test = request.getParameter("imp_uid");
		String test2 = request.getParameter("merchant_uid");
		String test3 = request.getParameter("pay_method");
		String amount = request.getParameter("amount");
		
		System.out.println(test);
		System.out.println(test2);
		System.out.println(amount);
		
	}
	

/*
	public String getToken() throws Exception {
		HttpURLConnection conn = null;
		String token = null; // 액세스 토큰
		URL url = new URL("https://api.iamport.kr/users/getToken");
		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");

		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");

		conn.setDoOutput(true);

		JSONObject obj = new JSONObject();
		obj.put("imp_key", "imp_key");
		obj.put("rest_api_secret", "rest_api_secret");

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();

		int result = 0;
		int responseCode = conn.getResponseCode();
		System.out.println("응답코드");

		if (responseCode == 200) {
			System.out.println("refund success");
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}
			br.close();
			System.out.println("" + sb.toString());
			result = 1; // 환불 성공

		} else {
			System.out.println(conn.getResponseMessage()); // 실패 0 변환
		}
		return token;

	}
}
*/
	
}


