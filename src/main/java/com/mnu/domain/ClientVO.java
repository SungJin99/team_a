package com.mnu.domain;

import lombok.Data;

@Data
public class ClientVO {
	private Long clientid;
	private String clientName;
	private String driverLicense;
	private String phoneNumber;
}
