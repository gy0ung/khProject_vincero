<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/rule.css?v=<%=System.currentTimeMillis()%>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/rule.js?v=<%=System.currentTimeMillis()%>"></script>
<meta charset="UTF-8">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp">
      <jsp:param value="빈체로 - 룰소개" name="title" />
  	</jsp:include>

  		<!-- 상단 메뉴버튼 및 스크립트 -->
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="support()">빈체로 소개</button>
		<button class="menuButton" type="button" onclick="rule()">룰 소개</button>
		<button class="menuButton" type="button" onclick="joinEnroll()">가맹점 신청</button>
	</nav>
	
	<script>
	function support() {
		location.href="${pageContext.request.contextPath}/support/support.su";
	}
	function rule() {
		location.href="${pageContext.request.contextPath}/support/rule.su";
	}
	function joinEnroll() {
		location.href="${pageContext.request.contextPath}/gym/joinEnroll.gym";
	}
	</script>
	
	<h1>공통 준수사항</h1>
<p>1. 음주이후 금지<br>
    2. 보호자(코치,부모님,친구) 필수<br>
    3. 시합전 자신 몸상태 확인<br>
    4. 복장준수(운동화 운동복등)<br>
    5. 안경착용 금지(렌즈착용)
    </p>

<p>원하는 종목을 확인해주세요</p>

<button class="button" onclick="showContent('유도')">유도</button>
<button class="button" onclick="showContent('태권도')">태권도</button>
<button class="button" onclick="showContent('종합격투기')">종합격투기</button>
<button class="button" onclick="showContent('복싱')">복싱</button>


<div id="rule"></div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
/* document.addEventListener('DOMContentLoaded', function() {
    document.querySelector("#sport1").click();
});

window.onload = function() {
    document.getElementById('sport1').click();
}; */
</script>

</html>
