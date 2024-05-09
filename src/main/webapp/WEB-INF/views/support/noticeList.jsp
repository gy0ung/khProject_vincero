<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/notice.css?v=<%=System.currentTimeMillis()%>"">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="빈체로 - 공지사항" name="title" />
	</jsp:include>

	<!-- 상단 메뉴버튼 및 스크립트 -->
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="noticeList()">공지사항</button>
		<button class="menuButton" type="button" onclick="FAQ()">자주묻는
			질문</button>
		<button class="menuButton" type="button" onclick="questionList()">질문
			게시판</button>
		<button class="menuButton" type="button" onclick="publicEmergency()">전국
			외상센터</button>
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
		<h2>- 공지사항 -</h2>
	</div>
		<table id="listTable">
			<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
				<c:if test="${loginMember.userType == 'admin'}">
					<td id="listButton" style="text-align:right !important;">
						<button id="enrollBtn">글쓰기</button>
					</td>
				</c:if>
			</tr>
			<tr>
				<th width="10%">글번호</th>
				<th width="50%">제목</th>
				<th width="10%">첨부파일</th>
				<th width="10%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${notice.noticeNo}</td>
					<td><a href="${pageContext.request.contextPath}/support/noticeDetail.su?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
					<td>
						<c:if test="${not empty notice.originalFilename}">
							<a href="${pageContext.request.contextPath}/support/fileDownloadNotice.su?noticeNo=${notice.noticeNo}"><img src="${pageContext.request.contextPath}/resources/img/file.png" alt="파일" width="20px"></a>
						</c:if>
					</td>
					<td>${notice.createDate}</td>
					<td>${notice.count}</td>
				</tr>
			</c:forEach>
		</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${pi.nowPage ne 1}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/support/noticeList.su?nowPage=${pi.nowPage-1}" >Previous&emsp;</a>
						</li>
					</c:if>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<c:choose>
							<c:when test="${p eq pi.nowPage}">
								<li class="page-item active">
									<a class="page-link" href="${pageContext.request.contextPath}/support/noticeList.su?nowPage=${p}">&emsp;${p}&emsp;</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/support/noticeList.su?nowPage=${p}">&emsp;${p}&emsp;</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${ pi.nowPage ne pi.totalPage }">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/support/noticeList.su?nowPage=${pi.nowPage+1}">&emsp;Next</a>
						</li>
					</c:if>
				</ul>
			</nav>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	document.querySelector("#enrollBtn").addEventListener('click', (e) => {
		location.href='${pageContext.request.contextPath}/support/noticeForm.su';
	});
</script>
</html>