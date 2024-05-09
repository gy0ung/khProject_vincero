package com.kh.spring.ranking.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.spring.ranking.model.vo.Ranking;
import com.kh.spring.ranking.model.vo.RankingList;

public interface RankingService {

	int decisionRankReg(String userId);

	int rankReg(Ranking ranking);

	Ranking getRankingData(String userId);

	int rankUpdate(Ranking ranking);

	int selectTotalRecordRankingListGender(String gender);

	int selectTotalRecordRankingListMajor(String major);

	int selectTotalRecordRankingListNick(String searchInput);

	int myRanking(String userId);

	int selectTotalRecordRankingList();

	List<RankingList> rankingListFilterGender(String gender, RowBounds rowBounds);

	List<RankingList> rankingListFilterMajor(String major, RowBounds rowBounds);

	List<RankingList> rankingListFilterNick(String searchInput, RowBounds rowBounds);

	List<RankingList> rankingListmyRanking(String userId, RowBounds rowBounds);

	List<RankingList> selectRankingList(RowBounds rowBounds);

}
