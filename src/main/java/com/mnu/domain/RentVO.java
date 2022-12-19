package com.mnu.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RentVO {
	private Long rentid;
	private Long clientid;
	private String clientName;
	private String carNumber;
	private Long carid;
	private Date rentStartDate;
	private Date rentEndDate;
}
