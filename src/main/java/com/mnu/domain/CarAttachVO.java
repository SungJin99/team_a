package com.mnu.domain;

import lombok.Data;

@Data
public class CarAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long carid;
}
