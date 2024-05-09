package com.kh.spring.ranking.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Ranking {
	private int rankingNo;
	private int matchCount;
    private int winCount;
    private int loseCount;
    private double point;
    private String userId;
}
