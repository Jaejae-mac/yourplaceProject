package com.yourplace.host.sales.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class HostSalesVO {
	private int rsvNum;
	private String payNum;
	private String placeMainCa;
	private String placeCate;
	private int payYear;
	private int payMonth;
	private int payDate;
	private int invCost; //원가
	private int coupDisPercent; //쿠폰 할인률 퍼센트
	private int invBeforeCost; //세전
	private int invTax; //세금
	private int invAfterCost; //세후
	/*
	 * 
CREATE TABLE invoice(
rsv_num int NOT NULL,
pay_num varchar(80) not null,
place_maincate varchar(100) not null,
place_cate varchar(100) not null,
pay_year int not null,
pay_month int not null,
pay_date int not null,
inv_cost int not null,
coup_dis_rate varchar(40) default null,
inv_bf_tax int not null,
inv_tax int not null,
inv_aft_tax int not null,
user_seq int NOT NULL auto_increment,
primary key(user_seq)
)default character set utf8;

	 */
}
