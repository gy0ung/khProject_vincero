<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/notice.css?v=<%=System.currentTimeMillis()%>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="빈체로 - 공지사항 상세보기" name="title"/>
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
	
<div id="notice">
	<div id="mainTitle">
		<h2>${notice.noticeTitle}</h2>
	</div>
		<form action="${pageContext.request.contextPath}/support/noticeUpdate.su" method="post" enctype="multipart/form-data">
			<c:if test="${loginMember.userType == 'admin'}">
				<div id="noticeTitle">
					<input type="text" name="noticeTitle" value="${notice.noticeTitle}" size="50"/>
				</div>
			</c:if>
				<div id="content">
					<c:choose>
						<c:when test="${loginMember.userType == 'admin'}">
							<textarea name="content" rows="50" cols="100" required>${notice.content}</textarea>
						</c:when>
						<c:otherwise>
							<textarea id="textarea" name="content" rows="50" cols="150" required readonly>${notice.content}</textarea>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="subInfo">
					<div id="fileDiv">첨부파일 &emsp;:&emsp;
						<c:choose>
							<c:when test="${loginMember.userType == 'admin'}">
								<c:if test="${not empty notice.originalFilename}">
									<button type="button" id="detailFile" class="btn btn-outline-secondary"
										onclick="location.href='${pageContext.request.contextPath}/support/fileDownloadNotice.su?noticeNo=${notice.noticeNo}'">${notice.originalFilename}
									</button>
								</c:if>
								<c:if test="${empty notice.originalFilename}">
									파일없음&emsp;&emsp;
								</c:if>
								<input type="file" name="upFile">
							</c:when>
							
							<c:otherwise>
								<c:if test="${not empty notice.originalFilename}">
									<button type="button" id="detailFile" class="btn btn-outline-secondary"
										onclick="location.href='${pageContext.request.contextPath}/support/fileDownloadNotice.su?noticeNo=${notice.noticeNo}'">${notice.originalFilename}
									</button>
								</c:if>
									<c:if test="${empty notice.originalFilename}">
										파일없음&emsp;&emsp;
									</c:if>
								</c:otherwise>
							</c:choose>
							
					</div>
					<div id="dateDiv">작성일 &emsp;:&emsp; ${notice.createDate}</div>
				</div>
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
		
		<c:if test="${loginMember.userType == 'admin'}">
			<div id="detailButton">
				<button type="submit">수정</button>&emsp;
				<button type="reset">취소</button>&emsp;
				<button type="button" id="deleteNotice">삭제</button>
			</div>
		</c:if>
		</form>
	<div>
		<button id="noticeDetailButton" type="button" onclick="location.href='${pageContext.request.contextPath}/support/noticeList.su'">리스트보기</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	$("#deleteNotice").click(function() {
	    location.href = '${pageContext.request.contextPath}/support/noticeDelete.su?noticeNo=${notice.noticeNo}';
	});
	$('.editable').each(function(){
	    this.contentEditable = true;
	});
</script>
</html>
