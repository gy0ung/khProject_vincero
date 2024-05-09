<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

  		<!-- 상단 메뉴버튼 및 스크립트 -->
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="gymForm()">나의 체육관 정보</button>
		<button class="menuButton" type="button" onclick="gymCalendar()">일정 관리</button>
	</nav>
	
	<script>
	function gymForm() {
		location.href="${pageContext.request.contextPath}/gym/gymForm.gym?userId=${loginMember.userId}";
	}
	function gymCalendar() {
		location.href="${pageContext.request.contextPath}/gym/gymCalendar.gym";
	}
	</script>

<div id="container">
	여기는 사용자 통계 화면입니다. 나중에 구현해주세요.
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>