package com.mnu.domain;

import java.util.List;

import lombok.Data;

@Data
public class CarVO {
	private Long carid;
	private String carNumber;
	private String series;
	private String carColor;
	
	private List<CarAttachVO> attachList;
}
