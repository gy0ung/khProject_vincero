<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/manager/manager.css">
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
      <jsp:param value="빈체로/관리자" name="title" />
  	</jsp:include>
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="notice()">공지사항</button>
		<button class="menuButton" type="button" onclick="question()">질문 게시판</button>
		<button class="menuButton" type="button" onclick="gymList()">체육관 조회</button>
		<button class="menuButton" type="button" onclick="memberList()">회원 조회</button>
	</nav>
	
<script>
	function notice() {
		location.href="${pageContext.request.contextPath}/support/noticeList.su";
	}
	function question() {
		location.href="${pageContext.request.contextPath}/support/questionList.su";
	}
	function gymList() {
		location.href="${pageContext.request.contextPath}/manager/mnGymList.mn";
	}
	function memberList() {
		location.href="${pageContext.request.contextPath}/manager/mnMemberList.mn";
	}
</script>

		<div style="display: flex; justify-content: center;">
		<form>
			<h1>진행 예정 경기</h1>
			<!-- 내 체육관 경기 리스트 테이블 -->
			<table class="table">
				<tr>
					<th>체육관</th>
					<th>일정</th>
					<th>시간</th>
					<th>신청자1</th>
					<th>신청자2</th>
					<th>프로필</th>
				</tr>

				<c:forEach items="${matchListView}" var="matchList">
					<tr align="center">
						<td>${matchList.gymName}</td>
						<td>${matchList}</td>
						<td>${matchList.matchdate}</td>
						<td>${matchList.matchtime}</td>
						<td>${matchList.proNick}</td>
						<td>${matchList.proNick2}</td>
						<td><button type="button" target="_blank"
								onclick="openProfile('${gymMatch.userId1}', '${gymMatch.userId2}');">프로필</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>