package com.yourplace.admin.revenue.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class RevenueVO {
	
//	private int rsvNum;
	private String payNum;
	private String placeMainCate;
	private String placeCate;
	private int payYear;
	private int payMonth;
	private int payDate;
//	private int invCost;
//	private int coupDisRate;
//	private int invBfTax;
//	private int invTax;
	private int invAftTax;
	private int userNum;

	private int revenue;
	
	private int cnt;

	@Override
	public String toString() {
		return "RevenueVO [payNum=" + payNum + ", placeMainCate=" + placeMainCate + ", placeCate=" + placeCate
				+ ", payYear=" + payYear + ", payMonth=" + payMonth + ", payDate=" + payDate + ", invAftTax="
				+ invAftTax + ", userNum=" + userNum + ", revenue=" + revenue + ", cnt=" + cnt + "] \r\n";
	}
	
	
	
}
