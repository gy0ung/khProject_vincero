<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/match/matchListView.css">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="빈체로 - 진행예정 매치" name="title" />
</jsp:include>
</head>
<!-- 상단 메뉴버튼 및 스크립트 -->
<nav id="menuNav">
	<button class="menuButton" type="button" onclick="matchReg()">매치
		등록</button>
	<button class="menuButton" type="button"
		onclick="location.href='${pageContext.request.contextPath}/match/matchList.ma'">매치
		찾기</button>
</nav>


<body>
	<div style="display: flex; justify-content: center;" class="matchListView">
		<form>
			<h1>진행예정 경기</h1>
			<table class="table">
				<tr>
					<th>날짜</th>
					<th>시간</th>
					<th>체육관</th>
					<th colspan="3">매치</th>
					<th>프로필</th>
				</tr>
				<c:forEach var="matchListView" items="${matchListView}">
					<tr align="center">
						<td>${matchListView.matchdatestring}</td>
						<td>${matchListView.matchtime}</td>
						<td>${matchListView.gymName}</td>
						<td>${matchListView.proNick}</td>
						<td>VS</td>
						<td>${matchListView.proNick2}</td>
						<td><button type="button" target="_blank"
								onclick="openProfile('${matchListView.userId1}', '${matchListView.userId2}');">프로필</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	<script>
		function openProfile(userId1, userId2) {
			window.open(
					"${pageContext.request.contextPath}/profile/profileDetailTwiceView.pr?userId1="
							+ userId1 + "&userId2=" + userId2, "_blank",
					"width=1100px, height=600px top=50px left=200px");
		}
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />