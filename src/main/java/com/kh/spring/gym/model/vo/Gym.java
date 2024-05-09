package com.kh.spring.gym.model.vo;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Gym {
	private int gymNo;
	private String gymName;
	private String gymType;
	private String gymBoss;
	private String gymCoach;
	private String coachPhone;
	private String gymPhone;
	private String gymZipcode;
	private String gymAddress;
	private String gymDetailaddress;
	private int matchCount;
	private String gymBank;
	private String gymAccount;
	private String businessNo;
	private Date gymRegdate;
	private int gymStatus;
	private String reason;
	private String userId;
}
