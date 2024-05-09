<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/match/matchList.css?v=<%=System.currentTimeMillis()%>">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div id="matchList">
   <div id="upperUpperStuff">
	   <input type="button" value="경기현황" onclick="beforeEndMatch()">
       <input type="button" value="경기결과" onclick="afterEndMatch()">
   </div>
   <div id="upperStuff">
      <div id="filter">
         <select id="MatchListFilterDow" onchange="MatchListFilterDow();">
            <option>요일</option>
              <option value="2">월요일</option>
              <option value="3">화요일</option>
              <option value="4">수요일</option>
              <option value="5">목요일</option>
              <option value="6">금요일</option>
              <option value="7">토요일</option>
              <option value="1">일요일</option>
          </select>
         <select id="MatchListFilterLocation" onchange="MatchListFilterLocation();">
            <option>지역</option>
            <option value="서울">서울</option>
            <option value="경기">경기</option>
            <option value="충청">충청</option>
            <option value="대전">대전</option>
            <option value="강원">강원</option>
            <option value="경상">경상</option>
            <option value="대구">대구</option>
            <option value="부산">부산</option>
            <option value="전라">전라</option>
            <option value="광주">광주</option>
            <option value="제주">제주</option>
         </select>
      </div>
   </div>
<div id="game">
   <div id="table">
      <table>
         <thead>
            <tr>
               <th width="10%">날짜</th>
               <th width="10%">시간</th>
               <th width="30%">장소</th>
               <th width="20%">등록자</th>
               <th>VS</th>
               <th width="20%">도전자</th>
               <th width="10%">승자</th>
            </tr>
         </thead>
         <tbody>
               <c:forEach var="matchList" items="${matchList}">
                  <tr>
                     <td>${matchList.matchdatestring}</td>
                     <td>${matchList.matchtime}</td>
                     <td>${matchList.gymAddress}<br>${matchList.gymDetailaddress}</td>
                     <td><a href="${pageContext.request.contextPath}/profile/profileDetail.pr?userId=${matchList.userId1}">${matchList.proNick}</a></td>
                     <td>VS</td>
                     <td><a href="${pageContext.request.contextPath}/profile/profileDetail.pr?userId=${matchList.userId2}">${matchList.proNick2}</a></td>
                     <td>
  						<c:choose>
  							<c:when test="${matchList.matchStatus == 4}">
  								경기전
  							</c:when>
  							<c:otherwise>
  								<c:choose>
		                     		<c:when test="${matchList.score1 == 1 && matchList.score2 == 0}">
		                     			${matchList.proNick}
		                     		</c:when>
		                     		<c:when test="${matchList.score2 == 1 && matchList.score1 == 0}">
		                     			${matchList.proNick2}
		                     		</c:when>
		                     	</c:choose>
  							</c:otherwise>
  						</c:choose>
                     </td>
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
               <a class="page-link" href="${pageContext.request.contextPath}/match/mainList.ma?nowPage=${pi.nowPage-1}&${filterType}=${filterTypeValue}" >Previous&emsp;</a>
            </li>
         </c:if>
         <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            <c:choose>
               <c:when test="${p eq pi.nowPage}">
                  <li class="page-item active">
                     <a class="page-link" href="${pageContext.request.contextPath}/match/mainList.ma?nowPage=${p}&${filterType}=${filterTypeValue}">&emsp;${p}&emsp;</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li class="page-item">
                     <a class="page-link" href="${pageContext.request.contextPath}/match/mainList.ma?nowPage=${p}&${filterType}=${filterTypeValue}">&emsp;${p}&emsp;</a>
                  </li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${ pi.nowPage ne pi.totalPage }">
            <li class="page-item">
               <a class="page-link" href="${pageContext.request.contextPath}/match/mainList.ma?nowPage=${pi.nowPage+1}&${filterType}=${filterTypeValue}">Next</a>
            </li>
         </c:if>
      </ul>
   </nav>
</div>
</body>
<script>
   function MatchListFilterDow() {
      const dowFromSelect = document.getElementById("MatchListFilterDow").value;
      const url = "${pageContext.request.contextPath}/match/mainList.ma?dowFromSelect=" + dowFromSelect;
      location.href = url;
   }

   function MatchListFilterLocation() {
      const locations = document.getElementById("MatchListFilterLocation").value;
      const url = "${pageContext.request.contextPath}/match/mainList.ma?locations=" + locations
       location.href = url;
   }
 
   function beforeEndMatch() {
	   const before = "before";
	   const url = "${pageContext.request.contextPath}/match/mainList.ma?before=" + before
       location.href = url;
   }
   
   function afterEndMatch() {
	   const after = "after";
	   const url = "${pageContext.request.contextPath}/match/mainList.ma?after=" + after
       location.href = url;
   }
   
</script>
</html>