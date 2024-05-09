<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ranking/rankingList.css?v=<%=System.currentTimeMillis()%>">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="rankingList">
   <div id="upperStuff">
      <div id="filter">
         <select id="RankingListFilterMajor" onchange="RankingListFilterMajor();">
            <option>종목</option>
              <option value="box">복싱류</option>
              <option value="taek">태권도</option>
              <option value="grap">잡기류</option>
              <option value="striker">킥복싱류</option>
          </select>
         <select id="RankingListFilterGender" onchange="RankingListFilterGender();">
            <option>성별</option>
            <option value="M">남자</option>
            <option value="F">여자</option>
         </select>
      </div>
      <div id="search">
         <input id="RankingListFilterNick" type="text" placeholder="닉네임을 검색 해보세요 !">
         <input class="buttonWithSearch" id="searchButton" type="button" value="검색">
      </div>
      <div id="view">
         <input class="buttonWithSearch" type="button" value="전체순위" onclick="location.href='${pageContext.request.contextPath}/ranking/rankingList.ra'">
         <input class="buttonWithSearch" type="button" value="내순위" onclick="myRanking('${loginMember.userId}','${loginMember.userStatus}');">
      </div>
   </div>
   <div id="rankingTable">
	  <div id="table">
	      <table>
	         <thead>
	            <tr id="theadPart">
	               <th>순위</th>
	               <th>닉네임</th>
	               <th>종목</th>
	               <th>전적</th>
	               <th>승률</th>
	               <th>점수</th>
	            </tr>
	         </thead>
	         <tbody>
	               <c:forEach var="rankingList" items="${rankingList}">
	                  <tr>
	                     <td>${rankingList.rankingNumber}위</td>
	                     <td><a href="${pageContext.request.contextPath}/profile/profileDetail.pr?userId=${rankingList.userId}">${rankingList.proNick}</a></td>
	                     <td>${rankingList.proMajor}</td>
	                     <td>${rankingList.winCount} / ${rankingList.loseCount}</td>
	                     <td>${Math.round(rankingList.winCount/rankingList.matchCount*100)}%</td>
	                     <td>${Math.round(rankingList.point)}점</td>
	                  </tr>
	               </c:forEach>
	         </tbody>
	      </table>
	   </div>   
	</div>
   <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
         <c:if test="${pi.nowPage ne 1}">
            <li class="page-item">
               <a class="page-link" href="${pageContext.request.contextPath}/ranking/rankingList.ra?nowPage=${pi.nowPage-1}&${filterType}=${filterTypeValue}" >Previous&emsp;</a>
            </li>
         </c:if>
         <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            <c:choose>
               <c:when test="${p eq pi.nowPage}">
                  <li class="page-item active">
                     <a class="page-link" href="${pageContext.request.contextPath}/ranking/rankingList.ra?nowPage=${p}&${filterType}=${filterTypeValue}">&emsp;${p}&emsp;</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li class="page-item">
                     <a class="page-link" href="${pageContext.request.contextPath}/ranking/rankingList.ra?nowPage=${p}&${filterType}=${filterTypeValue}">&emsp;${p}&emsp;</a>
                  </li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${ pi.nowPage ne pi.totalPage }">
            <li class="page-item">
               <a class="page-link" href="${pageContext.request.contextPath}/ranking/rankingList.ra?nowPage=${pi.nowPage+1}&${filterType}=${filterTypeValue}">Next</a>
            </li>
         </c:if>
      </ul>
   </nav>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
   function RankingListFilterGender() {
      const gender = document.getElementById("RankingListFilterGender").value;
      const url = "${pageContext.request.contextPath}/ranking/rankingList.ra?gender=" + gender
       location.href = url;
   }
   function RankingListFilterMajor() {
      const major = document.getElementById("RankingListFilterMajor").value;
      const url = "${pageContext.request.contextPath}/ranking/rankingList.ra?major=" + major
       location.href = url;
   }
   $("#searchButton").click(function() {
       const searchInput = document.getElementById("RankingListFilterNick").value;
       const url = "${pageContext.request.contextPath}/ranking/rankingList.ra?searchInput=" + searchInput
       location.href = url;
   });
   function myRanking(userId, userStatus) {
	   if(userId === "") {
	       alert("로그인을 먼저 하시고, 내등록을 클릭해주세요");
	   } else if(userStatus != 2) {
	       alert("프로필을 먼저 등록 하시고, 내등록을 클릭해주세요");
	   } else {
	   	   const url = "${pageContext.request.contextPath}/ranking/rankingList.ra?userId=" + userId
	       location.href = url;
	   }
   }
</script>
</html>