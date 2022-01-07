package com.icia.petopia.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SboardDTO {
	private int sbnumber;
	private String sbwriter;
	private String sbtitle;
	private String sbaddress;
	private String sbcontents;
	private String sbdate;
	private int sbprice;
	private int sbhits;
	private int sblikes;
	private MultipartFile sbfile;
	private String sbfilename;
}
