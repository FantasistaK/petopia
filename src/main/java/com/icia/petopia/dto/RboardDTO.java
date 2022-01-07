package com.icia.petopia.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RboardDTO {
	private int rbnumber;
	private String rbwriter;
	private String rbtitle;
	private String rbaddress;
	private String rbcategory;
	private String rbcontents;
	private String rbdate;
	private int rbhits;
	private int rblikes;
	private MultipartFile rbfile;
	private String rbfilename;

}
