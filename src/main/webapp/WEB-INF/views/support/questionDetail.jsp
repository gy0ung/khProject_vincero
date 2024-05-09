<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/question.css?v=<%=System.currentTimeMillis()%>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="빈체로 - 질문 상세보기" name="title"/>
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
<div id="container">
	<c:if test="${question.depth == 0}"><h1>${question.questionTitle}</h1></c:if>
	<c:if test="${question.depth == 1}"><h1>${question.questionWriter}님의 ${question.questionTitle}</h1></c:if>
		<form action="${pageContext.request.contextPath}/support/questionUpdate.su" method="post" enctype="multipart/form-data">
		<table id="detailTable">
			<tr>
				<c:if test="${question.depth == 0}">
					<th>제목 &emsp; : &emsp;</th>
					<td>
						<c:choose>
							<c:when test="${loginMember.userId == question.questionWriter}">
								<input type="text" name="questionTitle" value="${question.questionTitle}" size="50"/>
							</c:when>
							<c:otherwise>
								${question.questionTitle}
							</c:otherwise>
						</c:choose>
					</td>
				</c:if>
				<c:if test="${question.depth == 1}">
					<input type="hidden" name="questionTitle" value="${question.questionTitle}" size="50"/>
				</c:if>
			</tr>
			<tr>
				<th>작성자 &emsp; : &emsp;</th>
				<td>${question.questionWriter}</td>
			</tr>
			<tr>
				<c:if test="${question.depth == 0}">
				<th>첨부파일 &emsp; : &emsp;</th>
					<td>
						<c:choose>
							<c:when test="${loginMember.userId == question.questionWriter}">
								<c:if test="${not empty question.originalFilename}">
									<button type="button" id="detailFile" class="btn btn-outline-secondary"
										onclick="location.href='${pageContext.request.contextPath}/support/fileDownloadQuestion.su?questionNo=${question.questionNo}'">${question.originalFilename}
									</button>
								</c:if>
								<c:if test="${empty question.originalFilename}">
									파일없음&emsp;
								</c:if>
								<input type="file" name="upFile">
							</c:when>
							<c:otherwise>
								<c:if test="${not empty question.originalFilename}">
									<button type="button" id="detailFile" class="btn btn-outline-secondary"
										onclick="location.href='${pageContext.request.contextPath}/support/fileDownloadQuestion.su?questionNo=${question.questionNo}'">${question.originalFilename}
									</button>
								</c:if>
								<c:if test="${empty question.originalFilename}">
									파일없음&emsp;	
								</c:if>
							</c:otherwise>
						</c:choose>
					</td>
				</c:if>
			</tr>
			<tr>
				<th>내용 &emsp; : &emsp;</th>
				<td>
					<c:choose>
						<c:when test="${loginMember.userId == question.questionWriter}">
							<c:if test="${question.depth == 0}">
								<textarea name="content" rows="50" cols="100" required>${question.content}</textarea>
							</c:if>
							<c:if test="${question.depth == 1}">
								<textarea name="content" rows="50" cols="100" required readonly>${question.content}</textarea>
							</c:if>
						</c:when>
						<c:otherwise>
							<textarea name="content" rows="50" cols="100" required readonly>${question.content}</textarea>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>조회수 &emsp; : &emsp;</th>
				<td>${question.count}</td>
			</tr>
			<tr>
				<th>작성일 &emsp; : &emsp;</th>
				<td>${question.createDate}</td>
			</tr>
			<tr>
				<th>답변상태 &emsp; : &emsp;</th>
				<c:if test="${question.questionStatus == 0}">
					<td style="color:red">답변대기중</td>
				</c:if>
				<c:if test="${question.questionStatus == 1}">
					<td style="color:blue">답변완료</td>
				</c:if>
			</tr>
			<tr>
				<th></th>
				<td><input type="hidden" name="questionNo" value="${question.questionNo}"></td>
			</tr>
		</table>
		<div id="questionButton">
			<c:if test="${question.depth == 0}">
				<c:if test="${loginMember.userId == question.questionWriter}">
					<button type="submit">수정</button>&emsp;
					<button type="reset">취소</button>&emsp;
					<button type="button" id="deleteQuestion">삭제</button>&emsp;
				</c:if>
				<c:if test="${loginMember.userType == 'admin'}">
					<button type="button" id="answerQuestion" onclick="location.href='${pageContext.request.contextPath}/support/questionAnswerForm.su?questionNo=${question.questionNo}&questionWriter=${question.questionWriter}'">답변하기</button>&emsp;
					<button type="button" id="deleteQuestion">삭제</button>&emsp;
				</c:if>
			</c:if>
			<c:if test="${question.depth == 1}">
				<c:if test="${loginMember.userType == 'admin'}">
					<button type="reset">취소</button>&emsp;
					<button type="button" id="deleteQuestion">삭제</button>&emsp;
				</c:if>
			</c:if>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/support/questionList.su'">리스트보기</button>&emsp;
		</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	$("#deleteQuestion").click(function() {
	    location.href = '${pageContext.request.contextPath}/support/questionDelete.su?questionNo=${question.questionNo}&ref=${question.ref}';
	});
</script>	
</html>
