package com.sist.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int no;
	private String writer;
	private String pwd;
	private String title;
	private String content;
	Date  regdate;
	private int hit;
	private String fname;
	private int b_ref;
	private int b_step;
	private int b_level;
}
