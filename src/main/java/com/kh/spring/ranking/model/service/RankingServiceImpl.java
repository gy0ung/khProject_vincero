package com.kh.spring.ranking.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.ranking.model.dao.RankingDao;
import com.kh.spring.ranking.model.vo.Ranking;
import com.kh.spring.ranking.model.vo.RankingList;

@Service
public class RankingServiceImpl implements RankingService{
	
	@Autowired
	private RankingDao rankingDao;
	
	@Override
	public int decisionRankReg(String userId) {
		return rankingDao.decisionRankReg(userId);
	}

	@Override
	public int rankReg(Ranking ranking) {
		return rankingDao.rankReg(ranking);
	}

	@Override
	public Ranking getRankingData(String userId) {
		return rankingDao.getRankingData(userId);
	}

	@Override
	public int rankUpdate(Ranking ranking) {
		return rankingDao.rankUpdate(ranking);
	}

	@Override
	public int selectTotalRecordRankingListGender(String gender) {
		return rankingDao.selectTotalRecordRankingListGender(gender);
	}

	@Override
	public int selectTotalRecordRankingListMajor(String major) {
		return rankingDao.selectTotalRecordRankingListMajor(major);
	}

	@Override
	public int selectTotalRecordRankingListNick(String searchInput) {
		return rankingDao.selectTotalRecordRankingListNick(searchInput);
	}

	@Override
	public int myRanking(String userId) {
		return rankingDao.myRanking(userId);
	}

	@Override
	public int selectTotalRecordRankingList() {
		return rankingDao.selectTotalRecordRankingList();
	}

	@Override
	public List<RankingList> rankingListFilterGender(String gender, RowBounds rowBounds) {
		return rankingDao.rankingListFilterGender(gender, rowBounds);
	}

	@Override
	public List<RankingList> rankingListFilterMajor(String major, RowBounds rowBounds) {
		return rankingDao.rankingListFilterMajor(major, rowBounds);
	}

	@Override
	public List<RankingList> rankingListFilterNick(String searchInput, RowBounds rowBounds) {
		return rankingDao.rankingListFilterNick(searchInput, rowBounds);
	}

	@Override
	public List<RankingList> rankingListmyRanking(String userId, RowBounds rowBounds) {
		return rankingDao.rankingListmyRanking(userId, rowBounds);
	}

	@Override
	public List<RankingList> selectRankingList(RowBounds rowBounds) {
		return rankingDao.selectRankingList(rowBounds);
	}

}