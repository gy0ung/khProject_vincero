<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/question.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="빈체로 - 질문 글쓰기" name="title"/>
</jsp:include>

  		<!-- 상단 메뉴버튼 및 스크립트 -->
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="noticeList()">공지사항</button>
		<button class="menuButton" type="button" onclick="FAQ()">자주묻는 질문</button>
		<button class="menuButton" type="button" onclick="questionList()">질문 게시판</button>
		<button class="menuButton" type="button" onclick="publicEmergency()">전국 외상센터</button>
	</nav>
	
	<script>
	function noticeList() {
		location.href="${pageContext.request.contextPath}/support/noticeList.su";
	}
	function FAQ() {
		location.href="${pageContext.request.contextPath}/support/FAQ.su";
	}
	function questionList() {
		location.href="${pageContext.request.contextPath}/support/questionList.su";
	}
	function publicEmergency() {
		location.href="${pageContext.request.contextPath}/support/publicEmergency.su";
	}
	</script>
	
<div id="question">
	<div id="matinTitle">
		<h2>- 질문게시판 글쓰기 -</h2>
	</div>
	<form action="${pageContext.request.contextPath}/support/questionEnroll.su" method="post" name="enrollfrm" enctype="multipart/form-data">
		<table id="questionTable">
			<tr>
				<th>제목&emsp; : &emsp;</th>
				<td>
					<input name="questionTitle" size="50" placeholder="공백 포함 30자 정도를 넘기지 마세요." required>
				</td>
			</tr>
			<tr>
				<th>작성자&emsp; : &emsp;</th>
				<td>
					<input id="questionWriter" name="questionWriter" value="${loginMember.userId}" readonly>
				</td>
			</tr>
			<tr>
				<th>첨부파일&emsp; : &emsp;</th>
				<td>
					<input type="file" name="upFile">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="50" cols="100" required></textarea>
				</td>
			</tr>
		</table>
		<c:if test="${not empty loginMember.userId}">
			<div id="questionButton">
					<button type="submit" class="btn btn-outline-success">등록</button>
					<button type="reset" class="btn btn-outline-success">초기화</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/support/questionList.su'">리스트보기</button>
			</div>
		</c:if>
		<input type="hidden" id="userId" name="userId" value="${loginMember.userId}">
	</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>