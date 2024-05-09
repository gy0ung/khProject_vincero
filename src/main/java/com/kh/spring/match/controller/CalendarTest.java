package com.kh.spring.match.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CalendarTest {
	public static void main(String[] args) {
		System.out.println("hi");
		
		CalendarTest ct = new CalendarTest();
		ct.getDateList();
	}
	
	public List<HashMap<String, String>> getDateList() {
		
		List<HashMap<String, String>> result = new ArrayList<>();
		//오늘 날짜(요일) 구하기
		LocalDateTime today = LocalDateTime.now();
		System.out.println(today);
		DayOfWeek yoil = today.getDayOfWeek();
		System.out.println(yoil);
		
		String[] yoils = new String[]{"일", "월", "화", "수", "목", "금", "토"};
		
		int yoilNum = yoil.getValue();
		System.out.println(yoilNum);
		
		
		
		//그 주의 일요일 구하기
		LocalDateTime sunday = today.minusDays(yoilNum);
		System.out.println(sunday);
		
		//+14일치 구하기
		for(int i=0; i<14; i++) {
			LocalDateTime date = sunday.plusDays(i);
			System.out.println(date);
			
			DayOfWeek yoil2 = date.getDayOfWeek();
			int yoilNum2 = yoil2.getValue();
			System.out.println(yoilNum2%7);
			
			String yoil3 = yoils[yoilNum2%7];
			
			LocalDate day = date.toLocalDate();
			String dayTemp = day.toString();
			System.out.println(day);
			System.out.println(dayTemp);
			
			String dateTemp = date.format(DateTimeFormatter.ofPattern("M/d"));
			System.out.println(dateTemp);
			
			HashMap<String, String> yoilTemp = new HashMap<>();
			yoilTemp.put("date", dateTemp);
			yoilTemp.put("day", dayTemp);
			yoilTemp.put("yoil", yoil3);

			result.add(yoilTemp);
		}		
		System.out.println(result);
		
		return result;
	}
}
