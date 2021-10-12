package com.yourplace.host;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yourplace.host.chart.service.HostChartService;
import com.yourplace.host.chart.vo.HostChartVO;
import com.yourplace.host.reserv.service.HostReservService;
import com.yourplace.host.reserv.vo.HostReservVO;

@Controller

public class HomeController {
	@Inject
	HostChartService service;

	@RequestMapping(value = "/indexYourPlace.hdo")
	public ModelAndView mainView(HttpServletRequest request, HostChartVO vo) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
	
		String userId = (String) session.getAttribute("userId");

		vo.setUserId(userId);

		List<HostChartVO> list = service.getInvoiceChart(vo);
		List<Integer> su = new ArrayList<Integer>();

		LinkedHashMap<String, Integer> chartData = new LinkedHashMap<String, Integer>();

		System.out.println(list.toString());

		for (int i = 0; i < list.size(); i++) {
			int pay = list.get(i).getReserveValue();
			String payDate = list.get(i).getPayDate();

			System.out.println(pay);
			System.out.println(payDate);

			chartData.put(payDate, pay);

		}
		System.out.println(chartData);

		int value = 0;

		if (chartData.containsKey("1")) {
			value = chartData.get("1").intValue();
			su.add(value);
		}
		if (chartData.containsKey("2")) {
			value = chartData.get("2").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("3")) {
			value = chartData.get("3").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("4")) {
			value = chartData.get("4").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("5")) {
			value = chartData.get("5").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("6")) {
			value = chartData.get("6").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("7")) {
			value = chartData.get("7").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("8")) {
			value = chartData.get("8").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("9")) {
			value = chartData.get("9").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("10")) {
			value = chartData.get("10").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("11")) {
			value = chartData.get("11").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("12")) {
			value = chartData.get("12").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("13")) {
			value = chartData.get("13").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("14")) {
			value = chartData.get("14").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("15")) {
			value = chartData.get("15").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("16")) {
			value = chartData.get("16").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("17")) {
			value = chartData.get("17").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("18")) {
			value = chartData.get("18").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("19")) {
			value = chartData.get("19").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("20")) {
			value = chartData.get("20").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("21")) {
			value = chartData.get("21").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("22")) {
			value = chartData.get("22").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("23")) {
			value = chartData.get("23").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("24")) {
			value = chartData.get("24").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("25")) {
			value = chartData.get("25").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("26")) {
			value = chartData.get("26").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("27")) {
			value = chartData.get("27").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("28")) {
			value = chartData.get("28").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("29")) {
			value = chartData.get("29").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("30")) {
			value = chartData.get("30").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}
		if (chartData.containsKey("31")) {
			value = chartData.get("31").intValue();
			su.add(value);
		} else {
			value = 0;
			su.add(value);
		}

		System.out.println("su" + su.toString());
		mav.addObject("map", su);
		mav.addObject("userId", id);
		mav.setViewName("indexOurPlace");

		return mav;

	}

}
