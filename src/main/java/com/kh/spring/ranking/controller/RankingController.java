package com.kh.spring.ranking.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.match.model.service.MatchService;
import com.kh.spring.match.model.vo.ChallengerList;
import com.kh.spring.match.model.vo.MatchList;
import com.kh.spring.ranking.model.service.RankingService;
import com.kh.spring.ranking.model.vo.Ranking;
import com.kh.spring.ranking.model.vo.RankingList;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	
	@Autowired
	private RankingService rankingService;
	
	@GetMapping("/rankingReg.ra")
	   public void rankingReg(@RequestParam("userId1") String userId1,
	                                 @RequestParam("userId2") String userId2,
	                                 @RequestParam("score1") int score1,
	                                 @RequestParam("score2") int score2,
	                                 RedirectAttributes redirectAttributes)  {
	      
	      redirectAttributes.addAttribute("userId1", userId1);
	      redirectAttributes.addAttribute("userId2", userId2);
	      redirectAttributes.addAttribute("score1", score1);
	      redirectAttributes.addAttribute("score2", score2);
	 
		
		int decisionRankReg1 = rankingService.decisionRankReg(userId1);
		int decisionRankReg2 = rankingService.decisionRankReg(userId2);
		
		System.out.println(decisionRankReg1);
		System.out.println(decisionRankReg2);
		
		if(decisionRankReg1 == 0 && decisionRankReg2 == 0) {
			Ranking ranking1 = new Ranking();
			ranking1.setUserId(userId1);
			ranking1.setMatchCount(1);
			ranking1.setWinCount(score1);
			ranking1.setLoseCount(score2);
			double afterPoint1 = 1000 + 32 * (score1 - 0.5);
			ranking1.setPoint(afterPoint1);
			
			Ranking ranking2 = new Ranking();
			ranking2.setUserId(userId2);
			ranking2.setMatchCount(1);
			ranking2.setWinCount(score2);
			ranking2.setLoseCount(score1);
			double afterPoint2 = 1000 + 32 * (score2 - 0.5);
			ranking2.setPoint(afterPoint2);
			
			System.out.println(ranking1.toString());
			System.out.println(ranking2.toString());
			int result1 = rankingService.rankReg(ranking1);
			int result2 = rankingService.rankReg(ranking2);
		} else if(decisionRankReg1 == 0 && decisionRankReg2 == 1) {
			Ranking ranking1 = new Ranking();
			ranking1.setUserId(userId1);
			ranking1.setMatchCount(1);
			ranking1.setWinCount(score1);
			ranking1.setLoseCount(score2);
			
			double beforePoint2 = rankingService.getRankingData(userId2).getPoint();
			System.out.println(beforePoint2);
			double We1 = 1/(Math.pow(10, (beforePoint2-1000)/400)+1);
			System.out.println(We1);
			double afterPoint1 = 1000 + 32 * (score1 - We1);
			System.out.println(afterPoint1);
			ranking1.setPoint(afterPoint1);
			
			Ranking getRankingData2 = rankingService.getRankingData(userId2);

			Ranking ranking2 = new Ranking();
			ranking2.setRankingNo(getRankingData2.getRankingNo());
			ranking2.setUserId(getRankingData2.getUserId());
			ranking2.setMatchCount(getRankingData2.getMatchCount()+1);
			ranking2.setWinCount(getRankingData2.getWinCount()+score2);
			ranking2.setLoseCount(getRankingData2.getLoseCount()+score1);
			
			double We2 = 1/(Math.pow(10, (1000-beforePoint2)/400)+1);
			double afterPoint2 = beforePoint2 + 32 * (score2 - We2);
			ranking2.setPoint(afterPoint2);
			
			System.out.println(ranking1.toString());
			System.out.println(ranking2.toString());
			int result1 = rankingService.rankReg(ranking1);
			int result2 = rankingService.rankUpdate(ranking2);
		} else if(decisionRankReg1 == 1 && decisionRankReg2 == 0) {
			Ranking ranking2 = new Ranking();
			ranking2.setUserId(userId2);
			ranking2.setMatchCount(1);
			ranking2.setWinCount(score2);
			ranking2.setLoseCount(score1);
			
			double beforePoint1 = rankingService.getRankingData(userId1).getPoint();
			double We2 = 1/(Math.pow(10, (beforePoint1-1000)/400)+1);
			double afterPoint2 = 1000 + 32 * (score2 - We2);
			ranking2.setPoint(afterPoint2);
			
			Ranking getRankingData1 = rankingService.getRankingData(userId1);

			Ranking ranking1 = new Ranking();
			ranking1.setRankingNo(getRankingData1.getRankingNo());
			ranking1.setUserId(getRankingData1.getUserId());
			ranking1.setMatchCount(getRankingData1.getMatchCount()+1);
			ranking1.setWinCount(getRankingData1.getWinCount()+score1);
			ranking1.setLoseCount(getRankingData1.getLoseCount()+score2);
			
			double We1 = 1/(Math.pow(10, (1000-beforePoint1)/400)+1);
			double afterPoint1 = beforePoint1 + 32 * (score1 - We1);
			ranking1.setPoint(afterPoint1);
			
			System.out.println(ranking1.toString());
			System.out.println(ranking2.toString());
			int result1 = rankingService.rankReg(ranking2);
			int reulst2 = rankingService.rankUpdate(ranking1);
			
		} else if(decisionRankReg1 == 1 && decisionRankReg2 == 1) {
			
			Ranking getRankingData1 = rankingService.getRankingData(userId1);
			Ranking ranking1 = new Ranking();
			ranking1.setRankingNo(getRankingData1.getRankingNo());
			ranking1.setUserId(getRankingData1.getUserId());
			ranking1.setMatchCount(getRankingData1.getMatchCount()+1);
			ranking1.setWinCount(getRankingData1.getWinCount()+score1);
			ranking1.setLoseCount(getRankingData1.getLoseCount()+score2);
			
			double beforePoint1 = rankingService.getRankingData(userId1).getPoint();
			double beforePoint2 = rankingService.getRankingData(userId2).getPoint();
			
			double We1 = 1/(Math.pow(10, (beforePoint2-beforePoint1)/400)+1);
			double afterPoint1 = beforePoint1 + 32 * (score1 - We1);
			ranking1.setPoint(afterPoint1);
			
			Ranking getRankingData2 = rankingService.getRankingData(userId2);
			Ranking ranking2 = new Ranking();
			ranking2.setRankingNo(getRankingData2.getRankingNo());
			ranking2.setUserId(getRankingData2.getUserId());
			ranking2.setMatchCount(getRankingData2.getMatchCount()+1);
			ranking2.setWinCount(getRankingData2.getWinCount()+score2);
			ranking2.setLoseCount(getRankingData2.getLoseCount()+score1);
			
			double We2 = 1/(Math.pow(10, (beforePoint1-beforePoint2)/400)+1);
			double afterPoint2 = beforePoint2 + 32 * (score2 - We2);
			ranking2.setPoint(afterPoint2);
			
			System.out.println(ranking1.toString());
			System.out.println(ranking2.toString());
			int result1 = rankingService.rankUpdate(ranking1);
			int result2 = rankingService.rankUpdate(ranking2);
		}
		
	}
	
	@GetMapping("/rankingList.ra")
	public void rankingList(@RequestParam(defaultValue="1") int nowPage, Model model,
			@RequestParam(defaultValue="major") String major,
            @RequestParam(defaultValue="gender") String gender,
            @RequestParam(defaultValue="") String searchInput,
            @RequestParam(defaultValue="") String userId) {
		
			int totalRecord = 0;
			String filterType = null;
			String filterTypeValue = null;
			if(gender.equals("M") || gender.equals("F")) {
				totalRecord = rankingService.selectTotalRecordRankingListGender(gender);
				
			} else if(major.equals("box") || major.equals("striker") || major.equals("taek") || major.equals("grap")) {
				totalRecord = rankingService.selectTotalRecordRankingListMajor(major);
				
			} else if(!("".equals(searchInput))) {
				totalRecord = rankingService.selectTotalRecordRankingListNick(searchInput);
				
			} else if(!(userId.equals(""))) {
				totalRecord = rankingService.myRanking(userId);
				
			} else {
				totalRecord = rankingService.selectTotalRecordRankingList();
			}
			
			int limit = 10;
			int offset = (nowPage - 1) * limit;
			RowBounds rowBounds = new RowBounds(offset, limit);
			PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
			
			List<RankingList> rankingList = null;
			if(gender.equals("M") || gender.equals("F")) {
				rankingList = rankingService.rankingListFilterGender(gender, rowBounds);
				filterType = "gender";
				filterTypeValue = gender;
			} else if(major.equals("box") || major.equals("striker") || major.equals("taek") || major.equals("grap")) {
				rankingList = rankingService.rankingListFilterMajor(major, rowBounds);
				filterType = "major";
				filterTypeValue = major;
			} else if(!("".equals(searchInput))) {
				rankingList = rankingService.rankingListFilterNick(searchInput, rowBounds);
				filterType = "searchInput";
				filterTypeValue = searchInput;
			} else if(!(userId.equals(""))) {
				rankingList = rankingService.rankingListmyRanking(userId, rowBounds);
				filterType = "userId";
				filterTypeValue = userId;
			} else {
				rankingList = rankingService.selectRankingList(rowBounds);
			}
			
			List<RankingList> rankingListTmp = null;
			rankingListTmp = rankingService.selectRankingList(rowBounds);
			
			for(int i=0; i<rankingList.size(); i++) {
			  if(rankingList.get(i).getProMajor().equals("box")) {
				  rankingList.get(i).setProMajor("복싱류");
			  } else if(rankingList.get(i).getProMajor().equals("taek")) {
				  rankingList.get(i).setProMajor("태권도");
			  } else if(rankingList.get(i).getProMajor().equals("striker")) {
				  rankingList.get(i).setProMajor("킥복싱류");
			  } else if(rankingList.get(i).getProMajor().equals("grap")) {
				  rankingList.get(i).setProMajor("잡기류");
			  } else if(rankingList.get(i).getProMajor().equals("no")) {
				  rankingList.get(i).setProMajor("종목없음");
			  }
			}
			
			for(int i=0; i<rankingListTmp.size(); i++) {
				for(int j=0; j<rankingList.size(); j++) {
					if(rankingListTmp.get(i).getProNick().equals(rankingList.get(j).getProNick())) {
						rankingList.get(j).setRankingNumber(rankingListTmp.get(i).getRankingNumber());
					}
				}
			}
			
			model.addAttribute("rankingList", rankingList);
			model.addAttribute("pi", pi);
			model.addAttribute("filterType", filterType);
			model.addAttribute("filterTypeValue", filterTypeValue);
			}
}