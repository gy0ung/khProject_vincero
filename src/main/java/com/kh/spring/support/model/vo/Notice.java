package com.kh.spring.support.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	@NonNull
	private int noticeNo;
	@NonNull
	private String noticeTitle;
	@NonNull
	private String noticeWriter;
	@NonNull
	private String content;
	private String originalFilename;
	private String changeFilename;
	private int count;
	private Date createDate;
}