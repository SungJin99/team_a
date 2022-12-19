package com.mnu.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RepairVO {
	private Long repairid;
	private String repairCheckList;
	private String carNumber;
	private String series;
	private Date receipt;
}
