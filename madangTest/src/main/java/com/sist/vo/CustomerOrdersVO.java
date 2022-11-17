package com.sist.vo;

import java.sql.Date;

import lombok.Data;

@Data
// bookname, price, orderdate
public class CustomerOrdersVO {
	private String bookname;
	private int price;
	private Date orderdate;
}
